<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
        <%@page import ="com.springboot.springbootdealvps.entity.User"%>
    <%@page import ="com.springboot.springbootdealvps.service.Service"%>
    <%@page import ="java.util.*"%>
    <%
     User user = new User();
   /*  Service service = new Service(); */
    
    ArrayList<User> emp =  Service.display();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Insertion</title>
<!-- Add these lines in the head section of your HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>

</head>

<style>

	.{
	
	margin:0;
	padding:0;
	}
	

	
	.container{
	display:flex;
	}
	
	.container1{
	
	  		max-width: 500px;
	  		margin-left:25%;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	 h1 {
            text-align: center;
            color: #333333;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
            color: #333333;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        
        table{
        
        	width: 50%;
        	border: 1px solid #ccc;
        	text-align:center;
        }
        
        th, td{
        	padding: 10px;
        	text-align:left;
        	border-bottom: 1px solid #ccc;
        }
        
        th{
        	background-color: #f2f2f2;
        	font-weight: bold;
        }
        
        .container2{
      		border: 1px solid black;
  			width: 50% ;
  			    margin-left: 257px;
  			padding: 10px;

        
        }

@media(min-width:768px){
	
	.container{
	/* all:revert; */
	flex-direction:column;
	
	}

}

</style>

<body>

<div class="container">

<div class="container1">
<h1>Fill The Form</h1>
<form action="/submit" method="post" id="myForm" onsubmit="return validateForm()">

	<label>Id :</label>
	<input type="text" id="id" name="id" required>
	<br>
	
	<label>Name :</label>
	<input type="text" id="name" name="name" required>
	<br>
	
	<label>Desciption :</label>
	<input type="text" id="desciption" name="desciption" required>
	<br>
	
	<button type="submit">Submit</button>

</form>

</div><br><br><hr>

<div class="container2">
<h1>Display</h1>

<table border="1" cellspacing="0">

	<tr>
	<th>id</th>
	<th>Name</th>
	<th>Description</th>
	</tr>
	
	<% for(User u : emp) {%>
	
	<tr>
	
		<td><%= u.getId()%></td>
		<td><%= u.getName()%></td>
		<td><%= u.getDescription() %></td>
	
	</tr>
	<%} %>

</table>
</div>
</div>
<br><br>


<div class="container1">


    <form action="/submitid" method="post" onsubmit="return validateForm1()">
        <label>Enter Id to Search:</label>
        <input type="text" id="ids" name="ids" required/>
        
        
        
        <button type="submit">Submit</button>
    </form>




</div>

</body>


<script>

function validateForm(){
	let id = document.getElementById("id").value;
	let name = document.getElementById("name").value;
	let desciption = document.getElementById("desciption").value;
	
	const idRegex = /^[1-9]\d*$/; // Positive integers
    const stringRegex = /\S+/;    // Non-empty string

    if(!id.match(idRegex)){
    	Swal.fire({
    		icon:'error',
    		title:'Error',
    		text: 'Please Enter a valid Integer for ID.'
    	});
    	/* alert("Please enter a valid positive integer for ID."); */
    	 document.getElementById("id").value="";
    		document.getElementById("name").value="";
    		document.getElementById("desciption").value="";
    	return false;
    }
    
    if(!name.match(stringRegex)){
    	Swal.fire({
    		icon:'error',
    		title:'Error',
    		text:'Please Enter a Non- Empty name.'
    	});
    	/* alert("Please enter a non-empty name."); */
    	 document.getElementById("id").value="";
    		document.getElementById("name").value="";
    		document.getElementById("desciption").value="";
    	return false;
    }
    
    if(!desciption.match(stringRegex)){
    	Swal.fire({
    		icon:'error',
    		title:'Error',
    		text:'Please Enter a Non- Empty desciption.'
    	});
    	/* alert("Please enter a non-empty desciption."); */
    	 document.getElementById("id").value="";
    		document.getElementById("name").value="";
    		document.getElementById("desciption").value="";
    	return false;
    }
    
    Swal.fire({
    	icon:'success',
    	title:'Success',
    	text:'Form is Valid!'
    	
    });
   
    return true;
   
    
}

function validateForm1(){
	 let id = document.getElementById("ids").value;
	
	const idRegex = /^[1-9]\d*$/; // Positive integers

    if(!id.match(idRegex)){
    	Swal.fire({
    		icon:'error',
    		title:'Error',
    		text:'Please Enter a Valid Id.'
    	});
    	/* alert("Please enter a valid positive integer for ID."); */
    	  document.getElementById("id").value=""; 
    	return false;
    }
	
    Swal.fire({
    	icon:'success',
    	title:'Success',
    	text:'Form is Valid!'
    	
    });
   
    return true; 
    
}

</script>

</html>