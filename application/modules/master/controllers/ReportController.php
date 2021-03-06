﻿<?php
include APPLICATION_PATH . "/models/Report.php";
include APPLICATION_PATH."/models/Master_Print.php";
include APPLICATION_PATH."/models/Doc_Print_Create.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class Master_ReportController extends Zend_Controller_Action{
    public function init(){       
        $bootstrap = $this->getInvokeArg("bootstrap");
        $this->aConfig = $bootstrap->getOptions();
        $this->view->aConfig = $this->aConfig;
        $this->modelMapper = new Model_ReportMapper();
        $this->model= new Model_Report(); 
        $this->modelDocPrintCreate= new Model_Doc_Print_Create();
        $this->modelMapperDocPrintCreate = new Model_Doc_Print_CreateMapper();
        $this->modelmasterprint= new Model_Master_Print();
        $this->modelMappermasterprint = new Model_Master_PrintMapper();
    }
    public function indexAction(){      
    }
     public function mangementprintAction(){      
    }
    public function mangementuseprintAction(){      
    }
    public function mangementuseprintbysysdepartmentAction(){      
    }
  public function exportmangementprintAction() {
        $this->_helper->layout->disableLayout();
            $redirectUrl = $this->aConfig["site"]["url"]."master/report/mangementprint";
            $month = $this->_getParam("month","");
            $year = $this->_getParam("year","");
            $print_id = $this->_getParam("master_print_id","");
            if(empty($month) || empty($year)|| empty($print_id))
            {
                $this->_redirect($redirectUrl);
                return;
            }
            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);
            $rowCount = 13;
            $stt=1;
             $styledataArray = array(
                'font' => array(
                    'color' => array('rgb' => '080808'),
                    'size' => 13,
                    'name' => 'Times New Roman'
            ));
            $objPHPExcel->getActiveSheet()->setCellValue('A1', "CHI CỤC QUẢN LÝ THỊ TRƯỜNG BÌNH ĐỊNH");$objPHPExcel->getActiveSheet()->mergeCells('A1:E1');
            //$objPHPExcel->getActiveSheet()->setCellValue('A2', "Đơn vị:………………………");
            $objPHPExcel->getActiveSheet()->setCellValue('M1', "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM");$objPHPExcel->getActiveSheet()->mergeCells('M1:R1');
            $objPHPExcel->getActiveSheet()->setCellValue('M2', "Độc lập - Tự do - Hạnh phúc");$objPHPExcel->getActiveSheet()->mergeCells('M2:R2');			
            $objPHPExcel->getActiveSheet()->getStyle("M1:R2")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
           
            $objPHPExcel->getActiveSheet()->setCellValue('D4', "THEO DÕI TÌNH HÌNH ẤN CHỈ");$objPHPExcel->getActiveSheet()->mergeCells('D4:P4');
            $objPHPExcel->getActiveSheet()->getStyle("D4:P4")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
            $objPHPExcel->getActiveSheet()->getStyle("D4:E4")->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->setCellValue('D6', "Tên ấn chỉ: ".$this->modelMappermasterprint->findidby('name','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('D5:G5');
            $objPHPExcel->getActiveSheet()->setCellValue('D7', "Ký hiệu: ".$this->modelMappermasterprint->findidby('code','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('D5:G5');
              $objPHPExcel->getActiveSheet()->getStyle("A1:G7")->applyFromArray($styledataArray);   
           
            //BANG
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
                'wrap'=> true
            );
             $objPHPExcel->getActiveSheet()->setCellValue('A10', "Chứng từ");$objPHPExcel->getActiveSheet()->mergeCells('A10:B10');
             //$objPHPExcel->getActiveSheet()->getStyle("A10:B10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("A10:B10")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('A11', "Số");$objPHPExcel->getActiveSheet()->mergeCells('A11:A12');
             //$objPHPExcel->getActiveSheet()->getStyle("A11:A12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("A11:A12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('B11', "Ngày tháng");$objPHPExcel->getActiveSheet()->mergeCells('B11:B12');
             //$objPHPExcel->getActiveSheet()->getStyle("B11:B12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("B11:B12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('C10', "Diễn giải");$objPHPExcel->getActiveSheet()->mergeCells('C10:C12');
             //$objPHPExcel->getActiveSheet()->getStyle("C10:C12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("C10:C12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('D10', "Đơn vị tính");$objPHPExcel->getActiveSheet()->mergeCells('D10:D12');
             //$objPHPExcel->getActiveSheet()->getStyle("D10:D12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("D10:D12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('E10', "Số lượng quyển");$objPHPExcel->getActiveSheet()->mergeCells('E10:E12');
             //$objPHPExcel->getActiveSheet()->getStyle("E10:E12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("E10:E12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('F10', "Quyển số");$objPHPExcel->getActiveSheet()->mergeCells('F10:F12');
             //$objPHPExcel->getActiveSheet()->getStyle("F10:F12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("F10:F12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('G10', "Từ số đến số");$objPHPExcel->getActiveSheet()->mergeCells('G10:G12');
             //$objPHPExcel->getActiveSheet()->getStyle("G10:G12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("G10:G12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('H10', "Tồn đầu kỳ");$objPHPExcel->getActiveSheet()->mergeCells('H10:J10');
             //$objPHPExcel->getActiveSheet()->getStyle("H10:J10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("H10:J10")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('H11', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('H11:H12');
             //$objPHPExcel->getActiveSheet()->getStyle("H11:H12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("H11:H12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('I11', "Từ số đến số");$objPHPExcel->getActiveSheet()->mergeCells('I11:I12');
             //$objPHPExcel->getActiveSheet()->getStyle("I11:I12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("I11:I12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('J11', "Quyển số");$objPHPExcel->getActiveSheet()->mergeCells('J11:J12');
             //$objPHPExcel->getActiveSheet()->getStyle("J11:J12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("J11:J12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('K10', "Nhập trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('K10:M10');
             //$objPHPExcel->getActiveSheet()->getStyle("K10:M10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("K10:M10")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('K11', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('K11:K12');
             //$objPHPExcel->getActiveSheet()->getStyle("K11:K12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("K11:K12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('L11', "Từ số đến số");$objPHPExcel->getActiveSheet()->mergeCells('L11:L12');
             //$objPHPExcel->getActiveSheet()->getStyle("L11:L12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("L11:L12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('M11', "Quyển số");$objPHPExcel->getActiveSheet()->mergeCells('M11:M12');
             //$objPHPExcel->getActiveSheet()->getStyle("M11:M12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("M11:M12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('N10', "Xuất trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('N10:Q10');
             //$objPHPExcel->getActiveSheet()->getStyle("N10:Q10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("N10:Q10")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('N11', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('N11:N12');
             //$objPHPExcel->getActiveSheet()->getStyle("N11:N12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("N11:N12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('O11', "Từ số đến số");$objPHPExcel->getActiveSheet()->mergeCells('O11:O12');
             //$objPHPExcel->getActiveSheet()->getStyle("O11:O12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("O11:O12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('P11', "Quyển số");$objPHPExcel->getActiveSheet()->mergeCells('P11:P12');
             //$objPHPExcel->getActiveSheet()->getStyle("P11:P12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("P11:P12")->getAlignment()->applyFromArray($style_alignment);
             
               $objPHPExcel->getActiveSheet()->setCellValue('Q11', "Số hủy");$objPHPExcel->getActiveSheet()->mergeCells('Q11:Q12');
             //$objPHPExcel->getActiveSheet()->getStyle("Q11:Q12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("Q11:Q12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('R10', "Tồn cuối kỳ");$objPHPExcel->getActiveSheet()->mergeCells('R10:T10');
             //$objPHPExcel->getActiveSheet()->getStyle("R10:T10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("R10:T10")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('R11', "Từ số đến số");$objPHPExcel->getActiveSheet()->mergeCells('R11:R12');
             //$objPHPExcel->getActiveSheet()->getStyle("R11:R12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("R11:R12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('S11', "Quyển số");$objPHPExcel->getActiveSheet()->mergeCells('S11:S12');
             //$objPHPExcel->getActiveSheet()->getStyle("S11:S12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("S11:S12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->setCellValue('T11', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('T11:T12');
             //$objPHPExcel->getActiveSheet()->getStyle("T11:T12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             //$objPHPExcel->getActiveSheet()->getStyle("T11:T12")->getAlignment()->applyFromArray($style_alignment);
             
             $objPHPExcel->getActiveSheet()->getStyle("A10:T12")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             $objPHPExcel->getActiveSheet()->getStyle("A10:T12")->getAlignment()->applyFromArray($style_alignment);
             
             //thuc hien xuat du lieu ra file excel
            //lẤY DỮ LIỆU NHẬP TRONG KỲ
             
              foreach ($this->modelMapperDocPrintCreate->getImportExportPrint($month,$year,$print_id) as $value)
              {
                  
                    $objPHPExcel->getActiveSheet()->setCellValue('A' . $rowCount,$value['invoice_number']);
                    $objPHPExcel->getActiveSheet()->setCellValue('B' . $rowCount, GlobalLib::viewDate($value['created_date'],false));
                    $objPHPExcel->getActiveSheet()->setCellValue('D' . $rowCount, 'Cuốn');
                    $objPHPExcel->getActiveSheet()->setCellValue('E' . $rowCount, '1');
                    $objPHPExcel->getActiveSheet()->setCellValue('F' . $rowCount, $value['coefficient']);
                    $objPHPExcel->getActiveSheet()->setCellValue('G' . $rowCount, $value['serial']);
                    if($value['status'] == 'TonDauKy')
                    {
                        $objPHPExcel->getActiveSheet()->setCellValue('H' . $rowCount, '1');
                        if(strlen($value['serial_recovery']) > 0)
                        {
                            $objPHPExcel->getActiveSheet()->setCellValue('I' . $rowCount, $value['serial_recovery']);
                        }
                        else
                        {
                            $objPHPExcel->getActiveSheet()->setCellValue('I' . $rowCount, $value['serial']);
                        }
                       
                        $objPHPExcel->getActiveSheet()->setCellValue('J' . $rowCount, $value['coefficient']);
                        
                        
                    }
                    if($value['status'] == 'Import' || $value['status'] == 'Import And Export')
                    {
                        $objPHPExcel->getActiveSheet()->setCellValue('K' . $rowCount, '1');
                        $objPHPExcel->getActiveSheet()->setCellValue('L' . $rowCount, $value['serial']);
                        $objPHPExcel->getActiveSheet()->setCellValue('M' . $rowCount, $value['coefficient']);
                        
                        //Tồn
                        if($value['status'] == 'Import')
                        {
                            $objPHPExcel->getActiveSheet()->setCellValue('R' . $rowCount, $value['serial']);
                            $objPHPExcel->getActiveSheet()->setCellValue('S' . $rowCount,  $value['coefficient']);
                            $objPHPExcel->getActiveSheet()->setCellValue('T' . $rowCount,'1');
                        }
                        
                    }
                      if($value['status'] == 'Export' || $value['status'] == 'Import And Export')
                    {
                        $objPHPExcel->getActiveSheet()->setCellValue('N' . $rowCount, '1');
                        $objPHPExcel->getActiveSheet()->setCellValue('O' . $rowCount, $value['serial']);
                        $objPHPExcel->getActiveSheet()->setCellValue('P' . $rowCount, $value['coefficient']);
                        $objPHPExcel->getActiveSheet()->setCellValue('Q' . $rowCount, $value['serial_fail']);
                        if(strlen($value['serial_recovery']) > 0)
                        {
                            $objPHPExcel->getActiveSheet()->setCellValue('R' . $rowCount, $value['serial_recovery']);
                            $objPHPExcel->getActiveSheet()->setCellValue('S' . $rowCount,  $value['coefficient']);
                            $objPHPExcel->getActiveSheet()->setCellValue('T' . $rowCount,'1');
                        }
                        
                    }
                     $objPHPExcel->getActiveSheet()->getStyle('A' . $rowCount.':'.'T' . $rowCount)->getAlignment()->applyFromArray($style_alignment)->setWrapText(true);
                    
                    $objPHPExcel->getActiveSheet()->getStyle('A' . $rowCount.':'.'T' . $rowCount)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
                    $rowCount++;
              }
          
            $styleArray = array(
                'font' => array(
                    'bold' => true
                ),
            );
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "....,ngày....tháng....năm");
            $objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('P'.$rowCount.':T'.$rowCount)->getAlignment()->applyFromArray(
                                 array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT));
            
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "NGƯỜI LẬP BIỂU");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "THỦ TRƯỞNG ĐƠN VỊ");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->applyFromArray($styleArray);
              
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            
            $objPHPExcel->getActiveSheet()->getStyle("A1:L2")->applyFromArray($styleArray);
             $objPHPExcel->getActiveSheet()->getStyle("A10:T12")->applyFromArray($styleArray);
            
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER);
            //$objPHPExcel->getActiveSheet()->getStyle("A3:K" . $rowCount)->getAlignment()->applyFromArray($style_alignment);
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
            //tên file excel
            $filename='BaoCaoTheoDoiTinhHinhAnChi'.date("Y/m/d H:i:s").'.xls';
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename='.$filename);
            header('Cache-Control: max-age=0');
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $objWriter->save('php://output');
            exit();
    }
    public function exportmangementuseprintAction() {
        $this->_helper->layout->disableLayout();
            //$redirectUrl = $this->aConfig["site"]["url"]."master/docprintcreate/list";
            $month = $this->_getParam("month","");
            $year = $this->_getParam("year","");
            $quarter = $this->_getParam("quarter","");
            $actionExport= $this->_getParam("actionExport","");
            if(empty($actionExport) || empty($year))
            {
                $this->_redirect($redirectUrl);
                return;
            }
            $from ;$to;
            if($actionExport == "QUY")
            {
                if(empty($quarter))
                {
                    $this->_redirect($redirectUrl);
                    return;
                }
                if($quarter == "I")
                {
                    $from = $year."-01-01";
                    $to = $year."-03-31";
                }
                else if($quarter == "II")
                {
                    $from = $year."-04-01";
                    $to = $year."-06-30";
                }
                else if($quarter == "III")
                {
                     $from = $year."-07-01";
                    $to = $year."-09-30";
                }
                 else if($quarter == "IV")
                {
                    $from = $year."-10-01";
                    $to = $year."-12-31";
                }
            }
            if($actionExport == "THANG")
            {
                 $from = date_format(new DateTime($year."-".$month."-01"), 'Y-m-d');
                 $nextMonth = $month+1;
                 $nextdate = new DateTime($year."-".$nextMonth."-01");
                 date_add($nextdate, date_interval_create_from_date_string('-1 days'));
                 $to = date_format($nextdate, 'Y-m-d');
            }   
            if($actionExport == "NAM")
            {
                 $from = $year."-01-01";
                    $to = $year."-12-31";
            }  
            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);
            $rowCount = 11;
            $stt=1;
             $styledataArray = array(
                'font' => array(
                    'color' => array('rgb' => '080808'),
                    'size' => 13,
                    'name' => 'Times New Roman'
            ));
            $objPHPExcel->getActiveSheet()->setCellValue('A1', "CHI CỤC QUẢN LÝ THỊ TRƯỜNG BÌNH ĐỊNH");$objPHPExcel->getActiveSheet()->mergeCells('A1:E1');
            $objPHPExcel->getActiveSheet()->setCellValue('A2', "Đơn vị:………………………");$objPHPExcel->getActiveSheet()->mergeCells('A2:E2');
            $objPHPExcel->getActiveSheet()->setCellValue('M1', "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM");$objPHPExcel->getActiveSheet()->mergeCells('M1:R1');
            $objPHPExcel->getActiveSheet()->setCellValue('M2', "Độc lập - Tự do - Hạnh phúc");$objPHPExcel->getActiveSheet()->mergeCells('M2:R2');			
            $objPHPExcel->getActiveSheet()->getStyle("M1:R2")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
           
            $objPHPExcel->getActiveSheet()->setCellValue('D4', "BÁO CÁO THEO DÕI TÌNH HÌNH SỬ DỤNG ẤN CHỈ TRONG THÁNG/QUÝ/NĂM");$objPHPExcel->getActiveSheet()->mergeCells('D4:P4');
            $objPHPExcel->getActiveSheet()->getStyle("D4:P4")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
            $objPHPExcel->getActiveSheet()->getStyle("D4:E4")->getFont()->setBold(true);
//            $objPHPExcel->getActiveSheet()->setCellValue('D6', "Tên ấn chỉ: ".$this->modelMappermasterprint->findidby('name','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('D5:G5');
//            $objPHPExcel->getActiveSheet()->setCellValue('J6', "Ký hiệu: ".$this->modelMappermasterprint->findidby('code','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('J6:L6');
            $objPHPExcel->getActiveSheet()->getStyle("A1:T6")->applyFromArray($styledataArray);   
           
            //BANG
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
                'wrap'=> true
            );
             $objPHPExcel->getActiveSheet()->setCellValue('A7', "STT");$objPHPExcel->getActiveSheet()->mergeCells('A7:A10');
         
             $objPHPExcel->getActiveSheet()->setCellValue('B7', "Mã ấn chỉ");$objPHPExcel->getActiveSheet()->mergeCells('B7:B10');

             $objPHPExcel->getActiveSheet()->setCellValue('C7', "Tên loại");$objPHPExcel->getActiveSheet()->mergeCells('C7:C10');
             $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(35);
            
             $objPHPExcel->getActiveSheet()->setCellValue('D7', "Ký hiệu");$objPHPExcel->getActiveSheet()->mergeCells('D7:D10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('E7', "Số tồn đầu kỳ, mua/in phát hành/nhận trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('E7:I7');
             
             $objPHPExcel->getActiveSheet()->setCellValue('E8', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('E8:E10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('F8', "Tồn đầu kỳ");$objPHPExcel->getActiveSheet()->mergeCells('F8:G8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('F9', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('F9:F10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('G9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('G9:G10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('H8', "Mua/in phát hành/nhận");$objPHPExcel->getActiveSheet()->mergeCells('H8:I8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('H9', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('H9:H10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('I9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('I9:I10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('J7', "Sử dụng, xóa bỏ, mất, hỏng trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('J7:S7');
             
             $objPHPExcel->getActiveSheet()->setCellValue('J8', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('J8:L8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('J9', "Từ số ");$objPHPExcel->getActiveSheet()->mergeCells('J9:J10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('K9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('K9:K10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('L9', "Tổng");$objPHPExcel->getActiveSheet()->mergeCells('L9:L10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('M9', "Số lượng đã sử dụng");$objPHPExcel->getActiveSheet()->mergeCells('M9:M10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('N9', "Xóa bỏ");$objPHPExcel->getActiveSheet()->mergeCells('N9:O9');
             
             $objPHPExcel->getActiveSheet()->setCellValue('N10', "Số lượng");
             
             $objPHPExcel->getActiveSheet()->setCellValue('O10', "Số");
          
             $objPHPExcel->getActiveSheet()->setCellValue('P9', "Hết");$objPHPExcel->getActiveSheet()->mergeCells('P9:Q9');
          
             $objPHPExcel->getActiveSheet()->setCellValue('P10', "Số lượng");
           
             $objPHPExcel->getActiveSheet()->setCellValue('Q10', "Số");
            
             $objPHPExcel->getActiveSheet()->setCellValue('R9', "Hủy");$objPHPExcel->getActiveSheet()->mergeCells('R9:S9');
             $objPHPExcel->getActiveSheet()->setCellValue('R10', "Số lượng");
             $objPHPExcel->getActiveSheet()->setCellValue('S10', "Số");
             
             $objPHPExcel->getActiveSheet()->setCellValue('T7', "Tồn cuối kỳ");$objPHPExcel->getActiveSheet()->mergeCells('T7:V7');
             $objPHPExcel->getActiveSheet()->setCellValue('T8', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('T8:T10');
             $objPHPExcel->getActiveSheet()->setCellValue('U8', "Tới số");$objPHPExcel->getActiveSheet()->mergeCells('U8:U10');
             $objPHPExcel->getActiveSheet()->setCellValue('V8', "Số lượng");$objPHPExcel->getActiveSheet()->mergeCells('V8:V10');
             
             $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->getAlignment()->applyFromArray($style_alignment);
             
             //thuc hien xuat du lieu ra file excel
            //lẤY DỮ LIỆU NHẬP TRONG KỲ
             $style_alignmentleft = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER);
              foreach ($this->modelMapperDocPrintCreate->getUsePrint($from,$to) as $value)
              {
                 $objPHPExcel->getActiveSheet()->setCellValue('A' . $rowCount,$stt);
                 $objPHPExcel->getActiveSheet()->setCellValue('B' . $rowCount,$value['Code']);
                 $objPHPExcel->getActiveSheet()->setCellValue('C' . $rowCount,$value['Name']);
                 $objPHPExcel->getActiveSheet()->setCellValue('C' . $rowCount,$value['Name']);
                 $tong = $value['TDK_Tong'] + $value['TrongKy_TongSo'];
                  $objPHPExcel->getActiveSheet()->setCellValue('E' . $rowCount,$tong);
                 $objPHPExcel->getActiveSheet()->setCellValue('F' . $rowCount,$value['TDK_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('G' . $rowCount,$value['TDK_Denso']);
                  $objPHPExcel->getActiveSheet()->setCellValue('H' . $rowCount,$value['TrongKy_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('I' . $rowCount,$value['TrongKy_DenSo']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('J' . $rowCount,$value['SuDung_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('K' . $rowCount,$value['SuDung_DenSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('L' . $rowCount,$value['SuDung_Tong']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('M' . $rowCount,$value['SuDung_Tong']);
                   
                  $objPHPExcel->getActiveSheet()->setCellValue('N' . $rowCount,$value['XoaBo_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('O' . $rowCount,$value['XoaBo_So']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('P' . $rowCount,$value['Het_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('Q' . $rowCount,$value['Het_So']);
                  
                  $objPHPExcel->getActiveSheet()->setCellValue('R' . $rowCount,$value['Huy_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('S' . $rowCount,$value['Huy_So']);
                  
                  $objPHPExcel->getActiveSheet()->setCellValue('T' . $rowCount,$value['TCK_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('U' . $rowCount,$value['TCK_DenSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('V' . $rowCount,$value['Het_SoLuong']);
                  
                  $rowCount++;
                    $stt++;
              }
               $rowCount--;
                    $objPHPExcel->getActiveSheet()->getStyle('A11:V' . $rowCount)->getAlignment()->applyFromArray($style_alignment)->setWrapText(true);
                  $objPHPExcel->getActiveSheet()->getStyle('A11:V' . $rowCount)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
                   $objPHPExcel->getActiveSheet()->getStyle('C11:C' . $rowCount)->getAlignment()->applyFromArray($style_alignmentleft)->setWrapText(true);
                  $rowCount++;
//                 
//          
            $styleArray = array(
                'font' => array(
                    'bold' => true
                ),
            );
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "....,ngày....tháng....năm");
            $objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('P'.$rowCount.':T'.$rowCount)->getAlignment()->applyFromArray(
                                 array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT));
            
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "NGƯỜI LẬP BIỂU");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "THỦ TRƯỞNG ĐƠN VỊ");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->applyFromArray($styleArray);
              
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            
            $objPHPExcel->getActiveSheet()->getStyle("A1:L2")->applyFromArray($styleArray);
            $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->applyFromArray($styleArray);
            $objPHPExcel->getActiveSheet()->getStyle('A1:L'.$rowCount)->getFont()->setName('Times New Roman');
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER);
            //$objPHPExcel->getActiveSheet()->getStyle("A3:K" . $rowCount)->getAlignment()->applyFromArray($style_alignment);
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
            //tên file excel
            $filename='BaoCaoTinhHinhSuDungAnChi'.date("Y/m/d H:i:s").'.xls';
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename='.$filename);
            header('Cache-Control: max-age=0');
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $objWriter->save('php://output');
            exit();
    }
   public function exportmangementuseprintbysysdepartmentAction() {
        $this->_helper->layout->disableLayout();
            //$redirectUrl = $this->aConfig["site"]["url"]."admin/docprintcreate/list";
            $month = $this->_getParam("month","");
            $year = $this->_getParam("year","");
            $quarter = $this->_getParam("quarter","");
            $sys_department_id = $this->_getParam("sys_department_id","");
            $actionExport= $this->_getParam("actionExport","");
            if(empty($actionExport) || empty($year))
            {
                $this->_redirect($redirectUrl);
                return;
            }
            $from ;$to;
            if($actionExport == "QUY")
            {
                if(empty($quarter))
                {
                    $this->_redirect($redirectUrl);
                    return;
                }
                if($quarter == "I")
                {
                    $from = $year."-01-01";
                    $to = $year."-03-31";
                }
                else if($quarter == "II")
                {
                    $from = $year."-04-01";
                    $to = $year."-06-30";
                }
                else if($quarter == "III")
                {
                     $from = $year."-07-01";
                    $to = $year."-09-30";
                }
                 else if($quarter == "IV")
                {
                    $from = $year."-10-01";
                    $to = $year."-12-31";
                }
            }
            if($actionExport == "THANG")
            {
                 $from = date_format(new DateTime($year."-".$month."-01"), 'Y-m-d');
                 $nextMonth = $month+1;
                 $nextdate = new DateTime($year."-".$nextMonth."-01");
                 date_add($nextdate, date_interval_create_from_date_string('-1 days'));
                 $to = date_format($nextdate, 'Y-m-d');
            }   
            if($actionExport == "NAM")
            {
                 $from = $year."-01-01";
                 $to = $year."-12-31";
            }  
            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);
            $rowCount = 11;
            $stt=1;
             $styledataArray = array(
                'font' => array(
                    'color' => array('rgb' => '080808'),
                    'size' => 13,
                    'name' => 'Times New Roman'
            ));
            $objPHPExcel->getActiveSheet()->setCellValue('A1', "CHI CỤC QUẢN LÝ THỊ TRƯỜNG BÌNH ĐỊNH");$objPHPExcel->getActiveSheet()->mergeCells('A1:E1');
            $objPHPExcel->getActiveSheet()->setCellValue('A2', "Đơn vị:………………………");$objPHPExcel->getActiveSheet()->mergeCells('A2:E2');
            $objPHPExcel->getActiveSheet()->setCellValue('M1', "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM");$objPHPExcel->getActiveSheet()->mergeCells('M1:R1');
            $objPHPExcel->getActiveSheet()->setCellValue('M2', "Độc lập - Tự do - Hạnh phúc");$objPHPExcel->getActiveSheet()->mergeCells('M2:R2');			
            $objPHPExcel->getActiveSheet()->getStyle("M1:R2")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
           
            $objPHPExcel->getActiveSheet()->setCellValue('D4', "BÁO CÁO THEO DÕI TÌNH HÌNH SỬ DỤNG ẤN CHỈ TRONG THÁNG/QUÝ/NĂM");$objPHPExcel->getActiveSheet()->mergeCells('D4:P4');
            $objPHPExcel->getActiveSheet()->getStyle("D4:P4")->getAlignment()->applyFromArray(
                array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,)
            );
            $objPHPExcel->getActiveSheet()->getStyle("D4:E4")->getFont()->setBold(true);
//            $objPHPExcel->getActiveSheet()->setCellValue('D6', "Tên ấn chỉ: ".$this->modelMappermasterprint->findidby('name','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('D5:G5');
//            $objPHPExcel->getActiveSheet()->setCellValue('J6', "Ký hiệu: ".$this->modelMappermasterprint->findidby('code','id',$print_id));$objPHPExcel->getActiveSheet()->mergeCells('J6:L6');
            $objPHPExcel->getActiveSheet()->getStyle("A1:T6")->applyFromArray($styledataArray);   
           
            //BANG
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
                'wrap'=> true
            );
             $objPHPExcel->getActiveSheet()->setCellValue('A7', "STT");$objPHPExcel->getActiveSheet()->mergeCells('A7:A10');
         
             $objPHPExcel->getActiveSheet()->setCellValue('B7', "Mã ấn chỉ");$objPHPExcel->getActiveSheet()->mergeCells('B7:B10');

             $objPHPExcel->getActiveSheet()->setCellValue('C7', "Tên loại");$objPHPExcel->getActiveSheet()->mergeCells('C7:C10');
             $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(35);
            
             $objPHPExcel->getActiveSheet()->setCellValue('D7', "Ký hiệu");$objPHPExcel->getActiveSheet()->mergeCells('D7:D10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('E7', "Số tồn đầu kỳ, mua/in phát hành/nhận trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('E7:I7');
             
             $objPHPExcel->getActiveSheet()->setCellValue('E8', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('E8:E10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('F8', "Tồn đầu kỳ");$objPHPExcel->getActiveSheet()->mergeCells('F8:G8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('F9', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('F9:F10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('G9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('G9:G10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('H8', "Mua/in phát hành/nhận");$objPHPExcel->getActiveSheet()->mergeCells('H8:I8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('H9', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('H9:H10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('I9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('I9:I10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('J7', "Sử dụng, xóa bỏ, mất, hỏng trong kỳ");$objPHPExcel->getActiveSheet()->mergeCells('J7:S7');
             
             $objPHPExcel->getActiveSheet()->setCellValue('J8', "Tổng số");$objPHPExcel->getActiveSheet()->mergeCells('J8:L8');
            
             $objPHPExcel->getActiveSheet()->setCellValue('J9', "Từ số ");$objPHPExcel->getActiveSheet()->mergeCells('J9:J10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('K9', "Đến số");$objPHPExcel->getActiveSheet()->mergeCells('K9:K10');
            
             $objPHPExcel->getActiveSheet()->setCellValue('L9', "Tổng");$objPHPExcel->getActiveSheet()->mergeCells('L9:L10');
             
             $objPHPExcel->getActiveSheet()->setCellValue('M9', "Số lượng đã sử dụng");$objPHPExcel->getActiveSheet()->mergeCells('M9:M10');
           
             $objPHPExcel->getActiveSheet()->setCellValue('N9', "Xóa bỏ");$objPHPExcel->getActiveSheet()->mergeCells('N9:O9');
             
             $objPHPExcel->getActiveSheet()->setCellValue('N10', "Số lượng");
             
             $objPHPExcel->getActiveSheet()->setCellValue('O10', "Số");
          
             $objPHPExcel->getActiveSheet()->setCellValue('P9', "Hết");$objPHPExcel->getActiveSheet()->mergeCells('P9:Q9');
          
             $objPHPExcel->getActiveSheet()->setCellValue('P10', "Số lượng");
           
             $objPHPExcel->getActiveSheet()->setCellValue('Q10', "Số");
            
             $objPHPExcel->getActiveSheet()->setCellValue('R9', "Hủy");$objPHPExcel->getActiveSheet()->mergeCells('R9:S9');
             $objPHPExcel->getActiveSheet()->setCellValue('R10', "Số lượng");
             $objPHPExcel->getActiveSheet()->setCellValue('S10', "Số");
             
             $objPHPExcel->getActiveSheet()->setCellValue('T7', "Tồn cuối kỳ");$objPHPExcel->getActiveSheet()->mergeCells('T7:V7');
             $objPHPExcel->getActiveSheet()->setCellValue('T8', "Từ số");$objPHPExcel->getActiveSheet()->mergeCells('T8:T10');
             $objPHPExcel->getActiveSheet()->setCellValue('U8', "Tới số");$objPHPExcel->getActiveSheet()->mergeCells('U8:U10');
             $objPHPExcel->getActiveSheet()->setCellValue('V8', "Số lượng");$objPHPExcel->getActiveSheet()->mergeCells('V8:V10');
             
             $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
             $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->getAlignment()->applyFromArray($style_alignment);
             
             //thuc hien xuat du lieu ra file excel
            //lẤY DỮ LIỆU NHẬP TRONG KỲ
             
              foreach ($this->modelMapperDocPrintCreate->getUsePrintBySysdepartment($from,$to,$sys_department_id) as $value)
              {
                 $objPHPExcel->getActiveSheet()->setCellValue('A' . $rowCount,$stt);
                 $objPHPExcel->getActiveSheet()->setCellValue('B' . $rowCount,$value['Code']);
                 $objPHPExcel->getActiveSheet()->setCellValue('C' . $rowCount,$value['Name']);
                 $objPHPExcel->getActiveSheet()->setCellValue('C' . $rowCount,$value['Name']);
                 $tong = $value['TDK_Tong'] + $value['TrongKy_TongSo'];
                 $objPHPExcel->getActiveSheet()->setCellValue('E' . $rowCount,$value['Tong']);
                 $objPHPExcel->getActiveSheet()->setCellValue('F' . $rowCount,$value['TDK_TuSo']);
                 $objPHPExcel->getActiveSheet()->setCellValue('G' . $rowCount,$value['TDK_Denso']);
                  $objPHPExcel->getActiveSheet()->setCellValue('H' . $rowCount,$value['TrongKy_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('I' . $rowCount,$value['TrongKy_DenSo']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('J' . $rowCount,$value['SuDung_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('K' . $rowCount,$value['SuDung_DenSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('L' . $rowCount,$value['SuDung_Tong']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('M' . $rowCount,$value['SuDung_Tong']);
                   
                  $objPHPExcel->getActiveSheet()->setCellValue('N' . $rowCount,$value['XoaBo_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('O' . $rowCount,$value['XoaBo_So']);
                  
                   $objPHPExcel->getActiveSheet()->setCellValue('P' . $rowCount,$value['Het_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('Q' . $rowCount,$value['Het_So']);
                  
                  $objPHPExcel->getActiveSheet()->setCellValue('R' . $rowCount,$value['Huy_SoLuong']);
                  $objPHPExcel->getActiveSheet()->setCellValue('S' . $rowCount,$value['Huy_So']);
                  
                  $objPHPExcel->getActiveSheet()->setCellValue('T' . $rowCount,$value['TCK_TuSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('U' . $rowCount,$value['TCK_DenSo']);
                  $objPHPExcel->getActiveSheet()->setCellValue('V' . $rowCount,$value['TCK_SoLuong']);
                  
                  $rowCount++;
                    $stt++;
              }
               $rowCount--;
                    $objPHPExcel->getActiveSheet()->getStyle('A11:V' . $rowCount)->getAlignment()->applyFromArray($style_alignment)->setWrapText(true);
                  $objPHPExcel->getActiveSheet()->getStyle('A11:V' . $rowCount)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
                       $rowCount++;
//                 
//          
            $styleArray = array(
                'font' => array(
                    'bold' => true
                ),
            );
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "....,ngày....tháng....năm");
            $objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('P'.$rowCount.':T'.$rowCount)->getAlignment()->applyFromArray(
                                 array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT));
            
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "NGƯỜI LẬP BIỂU");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "THỦ TRƯỞNG ĐƠN VỊ");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->applyFromArray($styleArray);
              
            $rowCount++;
            $objPHPExcel->getActiveSheet()->setCellValue('P'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('P'.$rowCount.':T'.$rowCount);
            $objPHPExcel->getActiveSheet()->setCellValue('C'. $rowCount, "(Ký, ghi rõ họ tên)");$objPHPExcel->getActiveSheet()->mergeCells('C'.$rowCount.':E'.$rowCount);
            $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount.':P'.$rowCount)->getAlignment()->applyFromArray($style_alignment);
            
            $objPHPExcel->getActiveSheet()->getStyle("A1:L2")->applyFromArray($styleArray);
            $objPHPExcel->getActiveSheet()->getStyle("A7:V10")->applyFromArray($styleArray);
             $objPHPExcel->getActiveSheet()->getStyle('A1:L'.$rowCount)->getFont()->setName('Times New Roman');
            $style_alignment = array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER);
            //$objPHPExcel->getActiveSheet()->getStyle("A3:K" . $rowCount)->getAlignment()->applyFromArray($style_alignment);
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
            //tên file excel
            $filename='BaoCaoTinhHinhSuDungAnChi'.date("Y/m/d H:i:s").'.xls';
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename='.$filename);
            header('Cache-Control: max-age=0');
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $objWriter->save('php://output');
            exit();
    }
    public function addAction(){
        if($this->getRequest()->isPost()){
            $redirectUrl = $this->aConfig["site"]["url"]."master/masterunit/list";
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
            if(isset($_POST["comment"])){
                $this->model->setComment($_POST["comment"]);
            }
            if(isset($_POST["status"])){
                $status=1;
            } else {
                $status=0;
            }
            $this->model->setStatus($status); 
            $this->model->setIs_Delete(0);
            $this->model->setCreated_date(date("Y/m/d H:i:s"));
            $this->model->setCreated_By(GlobalLib::getLoginId());
            $this->model->setModified_date(date("Y/m/d H:i:s"));
            $this->model->setModified_By(GlobalLib::getLoginId());
            $this->modelMapper->save($this->model);
            $this->_redirect($redirectUrl);
        }
        $this->view->item=$this->model;
    }
    public function editAction(){
        $id = $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."master/masterunit/list";
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
             if(isset($_POST["comment"])){
                $this->model->setComment($_POST["comment"]);
            }
            if(isset($_POST["status"])){
                $status=1;
            } else {
                $status=0;
            }
            $this->model->setStatus($status);
            $this->model->setModified_date(date("Y/m/d H:i:s"));
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
                'Id'=>$items->getId(),
                'code'=>$items->getCode(),
                'name'=>$items->getName(),                
                'order'=>$items->getOrder(),
                'status'=>$items->getStatus()
            );
        }
        echo json_encode($menber);
        exit();
    }
    public  function confirmdeleteAction()
    {
        $id = $this->_getParam("id","0");
        $count = 0;
        echo $count;
        exit();
    }
    public function deleteAction(){
        $id= $this->_getParam("id","");
        $redirectUrl=$this->aConfig["site"]["url"]."master/masterunit/list";               
        $this->modelMapper->deleteMaster_Unit($id);
        $this->_redirect($redirectUrl);
    }    
    public function checkcodeAction(){
          $this->_helper->layout()->disableLayout();
         if($this->_request->isPost()){
             $code= $this->_getParam("code","");
             $id= $this->modelMapper->findidbyname('code',$code);
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
   
}
