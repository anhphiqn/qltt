<?php


    include_once  APPLICATION_PATH."/models/Type_Criteria.php";
    class Leader_TypeCriteriaController extends Zend_Controller_Action{
    //put your code here
    public function init() {
        $bootstrap = $this->getInvokeArg("bootstrap");
        $this->aConfig = $bootstrap->getOptions();
        $this->view->aConfig = $this->aConfig;
        $this->model= new Model_Type_Criteria();
        $this->modelMapper= new Model_Type_CriteriaMapper();    

    }    
    public function indexAction(){}
    public function listAction() {}    
    public function serviceAction() {
        $this->_helper->layout->disableLayout();
        foreach ($this->modelMapper->fetchAll() as $items ) {   
            if($items->getAdmin_Group_Id()==0 || $items->getAdmin_Group_Id()==NULL){
                $admin_group_id="Chưa có nhóm";
            } else {
                $admin_group_id=GlobalLib::getName("admin_group", $items->getAdmin_Group_Id(), "group_name");
            }
            $menber[]=array(
                'id'=>$items->getId(),
                'username'=>$items->getUserName(),                
                'first_name'=>$items->getFirst_Name(),
                'last_name'=>$items->getLast_Name(),
                'phone'=>$items->getPhone(),
                'birthday' => date("j/n/Y",strtotime($items->getBirthday()) ),
                'admin_group_id' =>$admin_group_id,
                'order'=>$items->getOrder(),
                'status'=>$items->getStatus()
            );
        }
        echo json_encode($menber);
        exit();
    }
    public function addAction() {
        if($this->getRequest()->isPost()){
            $redirectUrl = $this->aConfig["site"]["url"]."leader/typecriteria/list";            
            if(isset($_POST["id"])){
                $this->model->setId($_POST["id"]);
            }
            if(strlen($_POST["username"])>0){
                $this->model->setName($_POST["username"]);
            }
           
            $this->modelMapper->save($this->model);
            $this->_redirect($redirectUrl);
        }     
           $this->view->item= $this->model;
    }
    public function editAction() {
        $id= $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."leader/admin/list";
        if(empty($id)){
            $this->_redirect($redirectUrl);
        }
        $this->modelMapper->find($id,$this->model);
        $getId=$this->model->getId();
        if(empty($getId)){
             $this->_redirect($redirectUrl);
        }
        if($this->getRequest()->isPost()){
            if(isset($_POST["id"])){
                $this->model->setId($_POST["id"]);
            }
            if(strlen($_POST["username"])>0 ){
                $this->model->setUserName($_POST["username"]);
            }            
            if(strlen($_POST["phone"])>0){
                $this->model->setPhone($_POST["phone"]);
            }
            if(strlen($_POST["first_name"])>0){
                $this->model->setFirst_Name($_POST["first_name"]);
            }
            if(strlen($_POST["last_name"])>0){
                $this->model->setLast_Name($_POST["last_name"]);
            }            
            if(isset($_POST["birthday"])){
                $this->model->setBirthday(GlobalLib::toMysqlDateString($_POST["birthday"]));
            }
            if(isset($_POST["order"])){
                $this->model->setOrder($_POST["order"]);
            }
            if(isset($_POST["admin_group_id"])){
                $this->model->setAdmin_Group_Id($_POST["admin_group_id"]);
            }
            if (isset($_POST["status"])) {
                $status = 1;
            } else {
                $status = 0;
            }  
            $this->model->setStatus($status);  
            $this->model->setEmail($_POST["username"]);
            $this->model->setCreated(date("Y/m/d H:i:s"));
            $this->model->setCreated_By(GlobalLib::getLoginId());
            $this->model->setModified(date("Y/m/d H:i:s"));
            $this->model->setModified_By(GlobalLib::getLoginId());
            $this->modelMapper->save($this->model);
            $this->_redirect($redirectUrl);
        }        
        $this->view->item=$this->model;
    }
    public function changepasswordAction() {
        $id= $this->_getParam("id","");                
        $password= $this->_getParam("password","");
        $this->modelMapper->find($id,$this->model);
        $redirectUrl=$this->aConfig["site"]["url"]."leader/admin/list"; 
        if($this->getRequest()->isPost()){         
                $this->model->setPassword(md5($password));        
                $this->modelMapper->save($this->model);
            echo '[{"html":\'' . $redirectUrl . '\'}]';
            exit();       
        }
    }
    public  function confirmdeleteAction()
    {
        $id = $this->_getParam("id","0");
        $count = 0;
        foreach($this->AdminAreamodelMapper->fetchAll() as $item)
        {
            if($item->getAdmin_Id()==$id) $count= $count+1;
        }
        echo $count;
        exit();
    }
    
    public function deleteAction(){
        $id= $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."leader/admin/list";
        foreach ($this->AdminAreamodelMapper->fetchAll() as $item)
        {
            if($item->getAdmin_Id()==$id) $this->AdminAreamodelMapper->delete($item->getId());
        }
        $this->modelMapper->delete($id);
        $this->_redirect($redirectUrl);
    }
    
    public function checkusernameAction(){
        $this->_helper->layout->disableLayout();
        if($this->_request->isPost()){
            $username = $this->_getParam("username","");
            $usernameuser=$this->UsermodelMapper->findbyusername($username);
            $usernameadmin=$this->modelMapper->findbyusername($username);
            if($usernameuser != NULL || $usernameadmin != NULL){
                $menber[]=array(
                     'code'=>1,
                     'message'=>''
                         ); 
            } else {
                $menber[]=array(
                     'code'=>0,
                     'message'=>''
                         ); 
            }
            echo json_encode($menber);
            exit();
        }
    }
}
