package qm;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;



public class QueryExcel {
	
	/**
     * 获取数据,读取excel方法
     * @param file 给excel文件的位置
     * @return
     * @throws Exception
     */
	private static List<List<String>> readExcel(File file) throws Exception {

        // 创建输入流，读取Excel
        InputStream is = new FileInputStream(file.getAbsolutePath());
        // jxl提供的Workbook类
        Workbook wb = Workbook.getWorkbook(is);
        // 只有一个sheet,直接处理
        //创建一个Sheet对象
        Sheet sheet = wb.getSheet(0);
        // 得到所有的行数
        int rows = sheet.getRows();
        // 所有的数据
        List<List<String>> allData = new ArrayList<List<String>>();
        // 越过第一行 它是列名称
        for (int j = 1; j < rows; j++) {
         //每一行的所有格的数据
            List<String> oneData = new ArrayList<String>();
            // 得到每一行的单元格的数据
            Cell[] cells = sheet.getRow(j);
            for (int k = 0; k < cells.length; k++) {
                oneData.add(cells[k].getContents().trim());
            }
            // 存储每一条数据
            allData.add(oneData);
            // 打印出每一条数据
            //System.out.println(oneData);
            System.out.println("获取表格中的每个位置的数据："+oneData);

        }
        return allData;
    }
	
	/**
    * 处理数据的方法
    */ 
   public static  List<List<String>> dealData(List<List<String>> allData) {

       //处理分析excel表后的结果
       List<List<String>> result=new ArrayList<List<String>>();

    for(int i=0;i<allData.size();i++) {
    //表示每一行所有格子的数据集合
        List<String> oneDatai=allData.get(i);
        System.out.println("每行对应的数据："+oneDatai);
        //解析每一行数据
        for(int j=0;j<oneDatai.size();j++) {
        	String str=oneDatai.get(j);
        	System.out.println(oneDatai.get(0)+"2号"+oneDatai.get(1));
        	SimpleDateFormat adf=new SimpleDateFormat("yy-MM-dd");
        	if(j==0|j==1) {
        		System.out.println("s输出j:"+j);
        		try {
    				Date time=adf.parse(oneDatai.get(j));
    				System.out.println(time);
    				SimpleDateFormat adf1=new SimpleDateFormat("yyyy/MM/dd");
    				if(j==0) {
    					String createTime=adf1.format(time);
        				System.out.println("创建时间："+createTime);
    				}else {
    					String checkTime=adf1.format(time);
        				System.out.println("校对时间："+checkTime);
    				}
    				
    			} catch (ParseException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
        	}
        	
        	
        }
        //判断是否为病例期
//        if("1".equals(oneDatai.get(4).trim())) {

//            for(int j=0;j<allData.size();j++) {
//               System.out.println(allData.get(j));
//                List<String> oneDataj=allData.get(j);
//                if(oneDatai.get(4).trim().equals(oneDataj.get(4).trim())) {
//                //判断月份是否相同
//                if(oneDatai.get(1).trim().equals(oneDataj.get(1).trim())) {
//                    //判断周几相同
//                    if(oneDatai.get(2).trim().equals(oneDataj.get(2).trim())) {
//                    	
//                        System.out.println(oneDataj);
//                        result.add(oneDataj);
//                    }
//                }
//
//                }
//
//            }

        }
//    }
    return result;
}
  
   /**
    * 将数据写入到excel中
    */
   public static  void makeExcel(List<List<String>> result) {

       //第一步，创建一个workbook对应一个excel文件
       HSSFWorkbook workbook = new HSSFWorkbook();
       //第二部，在workbook中创建一个sheet对应excel中的sheet
       HSSFSheet sheet = workbook.createSheet("季度信息");
       //第三部，在sheet表中添加表头第0行，老版本的poi对sheet的行列有限制
       HSSFRow row = sheet.createRow(0);
       //第四步，创建单元格，设置表头
       HSSFCell cell = row.createCell(0);
       cell.setCellValue("id");
       cell = row.createCell(1);
       cell.setCellValue("uid");
       cell = row.createCell(2);
       cell.setCellValue("nickname");
       cell = row.createCell(3);
       cell.setCellValue("award");
       cell = row.createCell(4);
       cell.setCellValue("month");
       cell = row.createCell(5);
       cell.setCellValue("quarter");
  

       //第五步，写入数据
       for(int i=0;i<result.size();i++) {

           List<String> oneData = result.get(i);
           HSSFRow row1 = sheet.createRow(i + 1);
           for(int j=0;j<oneData.size();j++) {
                //创建单元格设值
               row1.createCell(j).setCellValue(oneData.get(j));
           }
       }

       //将文件保存到指定的位置
       try {
           FileOutputStream fos = new FileOutputStream("/Users/jiangnan/Desktop");
           workbook.write(fos);
           System.out.println("写入成功");
           fos.close();
       } catch (IOException e) {
           e.printStackTrace();
       }
   }
   

    public static void main(String[] args) {

        // 读取Excel文件
        File file = new File("/Users/jiangnan/Desktop/季度信息统计.xls");
        try {
            //得到所有数据
            List<List<String>> allData=readExcel(file);
          System.out.println("读取到的信息："+allData);
            //直接将它写到excel中
           List<List<String>> result=dealData(allData);        
           System.out.println("结果是："+result);
//            makeExcel(result);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
    
}