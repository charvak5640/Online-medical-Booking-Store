import javax.servlet.http.*;

public class Category extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse res)
	{
		
		
		
		String status=null;

		bean.CategoryInsert ci=new bean.CategoryInsert();
		String name=request.getParameter("add").trim();

		if(name.equals("Add"))
		{
	String category=request.getParameter("category");
	System.out.println("------------"+category);
	ci.setCtegory(category);
	try
		{
	boolean b=ci.categoryDataInsert();
	System.out.println("<<<<<<<<>>>>>>>>."+b);	
	if(b==true){
status="Category Detailes Added SuccessFully";
	System.out.println("------------"+status);
	getServletContext().getRequestDispatcher("/Category.jsp?status='"+status+"'").forward(request,res);


//	getServletContext().getRequestDispatcher("/Category.jsp");
	}
	else
	{

status="Failed to load Category Detailes";
System.out.println("------------"+status);

getServletContext().getRequestDispatcher("/Category.jsp?status='"+status+"'").forward(request,res);
}
}
		catch(Exception e)
		{
	System.out.println(e);	
	
	try
		{
status="Failed to load Category Detailes Already Exist";

getServletContext().getRequestDispatcher("/Category.jsp?status='"+status+"'").forward(request,res);
			}
			catch(Exception e1)
		{
			System.out.println(e1);	
		}
		}
	}
	else if(name.equals("Delete"))
	{

	try{
		//boolean b=ci.categoryDataUpdate();
	}
		catch(Exception e)
		{
	System.out.println(e);			
		}
	
	}
if(name.equals("Update"))
		{
	status="";
String seCategory=null;
String category=null;


try{
seCategory=request.getParameter("category");
category=request.getParameter("upcategory");

System.out.println(seCategory+"<<<<<<<<<>>>>>>>>>"+category);	

boolean b=ci.categoryDataUpdate(seCategory,category);

	status="Category "+seCategory+"  updated SuccessFully";
    getServletContext().getRequestDispatcher("/CategoryUPDEL.jsp?status='"+status+"'").forward(request,res);
	
	
	}
		catch(Exception e)
		{
	
	System.out.println(e);			
		}

		}



	}

}
