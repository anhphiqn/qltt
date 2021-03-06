<?php
include APPLICATION_PATH . "/models/Type_Commodity.php";

class Admin_TypeCommodityController extends Zend_Controller_Action{
    public function init(){       
        $bootstrap = $this->getInvokeArg("bootstrap");
        $this->aConfig = $bootstrap->getOptions();
        $this->view->aConfig = $this->aConfig;
        $this->modelMapper= new Model_Type_CommodityMapper();
        $this->model= new Model_Type_Commodity();
       // $this->DistrictmodelMapper = new Model_Type_CommodityMapper();
       
    }
    public function indexAction(){
       // $this->view->item=$this->modelMapper->fetchAll();
    }
    public function addAction(){
        if($this->getRequest()->isPost()){
            $redirectUrl = $this->aConfig["site"]["url"]."admin/typecommodity/list";
            if(isset($_POST["id"])){
                $this->model->setId($_POST["id"]);
            }
            if(isset($_POST["code"])){
                $this->model->setCode($_POST["code"]);
            }
            if(isset($_POST["name"])){
                $this->model->setName($_POST["name"]);
            }
            if(isset($_POST["order"])){
                $this->model->setOrder($_POST["order"]);
            }
            if(isset($_POST["status"])){
                $status=1;
            } else {
                $status=0;
            }
            $this->model->setStatus($status);
            $this->model->setCreated(date("Y/m/d H:i:s"));
            $this->model->setCreated_By(GlobalLib::getLoginId());
            $this->model->setModified(date("Y/m/d H:i:s"));
            $this->model->setModified_By(GlobalLib::getLoginId());
            $this->modelMapper->save($this->model);
            $this->_redirect($redirectUrl);
        }
        $this->view->item=$this->model;
    }
    public function editAction(){
        $id = $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."admin/typecommodity/list";
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
            if(isset($_POST["code"])){
                $this->model->setCode($_POST["code"]);
            }
            if(isset($_POST["name"])){
                $this->model->setName($_POST["name"]);
            }
            if(isset($_POST["order"])){
                $this->model->setOrder($_POST["order"]);
            }
            if(isset($_POST["status"])){
                $status=1;
            } else {
                $status=0;
            }
            $this->model->setStatus($status);
            $this->model->setModified(date("Y/m/d H:i:s"));
            $this->model->setModified_By(GlobalLib::getLoginId());
            $this->modelMapper->save($this->model);
            $this->_redirect($redirectUrl);
        }
        $this->view->item=$this->model;
    }   
    public function listAction(){
        $this->view->controller = $this;
        $this->view->item=$this->modelMapper->fetchAll();
    }
    
    public function serviceAction(){
        $this->_helper->layout->disableLayout();
        foreach ($this->modelMapper->fetchAll() as $items ) {
            $menber[]=array(
                'id'=>$items->getId(),
                'code'=>$items->getCode(),
                'name'=>$items->getName(),                
                'order'=>$items->getOrder()
            );
        }
        echo json_encode($menber);
        exit();
    }
     public function getprovinceAction(){
          $this->_helper->layout()->disableLayout();
                $provinceHTML = '<select name="province_id" style="width: 386px;"><option value=""></option></select>';
                if ($this->_request->isPost()) {
                    $area_id = $this->_getParam("area_id", "");
                    if (is_numeric($area_id)) {
                        $provinceHTML = GlobalLib::getCombo('province_id', 'province', 'id', 'name', 0, FALSE, 'where id in (select province_id from area_province_category where area_id=' . $area_id.')');
                    }
                }
                echo '[{"html":\'' . $provinceHTML . '\'}]';
                exit;
    }
    public  function confirmdeleteAction()
    {
        $id = $this->_getParam("id","0");
        $count = 0;
        foreach($this->DistrictmodelMapper->fetchAll() as $item)
        {
            if($item->getProvince_Id()==$id) $count= $count+1;
        }
//        foreach($this->AdminAreamodelMapper->fetchAll() as $item)
//        {
//            if($item->getArea_Id()==$id) $count= $count+1;
//        }
        echo $count;
        exit();
    }
    public function deleteAction(){
        $id= $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."admin/province/list";                       
        foreach($this->DistrictmodelMapper->fetchAll() as $item)
        {
            if($item->getProvince_Id()==$id)
            {
                $this->DistrictmodelMapper->delete($item->getId());
            }
        }      
//        foreach($this->AreaProvinceCategorymodelMapper->fetchAll() as $item)
//        {
//            if($item->getProvince_Id()==$id)
//            {
//                $this->AreaProvinceCategorymodelMapper->delete($item->getId());
//            }
//        }
//        foreach($this->AdminAreamodelMapper->fetchAll() as $item)
//        {
//            if($item->getArea_Id()==$id)
//            {
//                $this->AdminAreamodelMapper->delete($item->getId());
//            }
//        }
        $this->modelMapper->delete($id);
        $this->_redirect($redirectUrl);        
    }    
    
    public function exportAction() {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);
            $rowCount = 4;
            $stt=1;
            $objPHPExcel->getActiveSheet()->setCellValue('B3', "STT");
            $objPHPExcel->getActiveSheet()->setCellValue('C3', "Mã code");
            $objPHPExcel->getActiveSheet()->setCellValue('D3', "Tên");
            
            foreach ($this->modelMapper->fetchAll() as $items) {
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $rowCount, $stt);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $rowCount, $items->getProvince_Code());
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $rowCount, $items->getName());                
                $rowCount++;
                $stt++;
            }
            $objPHPExcel->getActiveSheet()->mergeCells('A1:B2');
            $objPHPExcel->getActiveSheet()->mergeCells('C1:E2');
            $objPHPExcel->getActiveSheet()->setCellValue('C1', "Danh Sách Tỉnh");
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER);
            $objPHPExcel->getActiveSheet()->getStyle("B3:L" . $rowCount)->getAlignment()->applyFromArray($style_alignment);
            $styleArray = array(
                'borders' => array(
                    'allborders' => array(
                        'style' => PHPExcel_Style_Border::BORDER_THIN,
                    ),
                ),
            );
            $styledataArray = array(
                'font' => array(
                    'bold' => true,
                    'color' => array('rgb' => '080808'),
                    'size' => 15,
                    'name' => 'Times New Roman'
            ));
            $styletitleArray=array(
                'font' => array(
                    'bold' => true,
                    'color' => array('rgb' => '080808'),
                    'size' => 10,
                    'name' => 'Times New Roman')
            );
            $objPHPExcel->getActiveSheet()->getStyle('C1')->getAlignment()->applyFromArray($style_alignment);
            $objPHPExcel->getActiveSheet()->getStyle('C1')->applyFromArray($styledataArray);
            $objPHPExcel->getActiveSheet()->getStyle('B3:L3')->applyFromArray($styletitleArray);
            $objPHPExcel->getActiveSheet()->getStyle('B3:E' . ($rowCount - 1))->applyFromArray($styleArray);
            foreach (range('B', 'E') as $columnID) {
                $objPHPExcel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
            }
            $filename='DanhSachTinh '.date('m-Y').'.xls';
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename='.$filename);
            header('Cache-Control: max-age=0');
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $objWriter->save('php://output');
            exit();
        }
    }
    
    public function checkprovincecodeAction(){
          $this->_helper->layout()->disableLayout();
         if($this->_request->isPost()){
             $province_code= $this->_getParam("province_code","");
             $id= $this->modelMapper->findidbycode($province_code);
             if($id !=0){
                 $menber[]=array(
                     'code'=>1,
                     'message'=>'Mã code này đã tồn tại. Vui lòng kiểm tra và nhập lại'
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
    public function checkprovincenameAction(){
        $this->_helper->layout()->disableLayout();
        if($this->_request->isPost()){
            $province_name=$this->_getParam("province_name","");
            $id=$this->modelMapper->findidbyname($province_name);
            if($id !=0){
                 $menber[]=array(
                     'code'=>1,
                     'message'=>'Tên tỉnh đã tồn tại.Vui lòng kiểm tra và nhập lại'
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
