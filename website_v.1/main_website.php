<html>
    <head>
        <meta charset='utf-8'>
        <title>Weekly Programm</title>

        <style>
                table {
                font-family: arial, sans-serif;
                border: 1px solid black;
                }

                td, th {
               
                border: 1px solid black;
                text-align: left;
                padding: 8px;
                }

        </style>
    
    </head>
    <body>
        <?php
               //From login.php  takes ID;
               session_start();
               $id = $_SESSION['ID'];

                
               /* Attempt MySQL server connection. Assuming you are running MySQL
	            server with default setting (user 'root' with no password) */
		        $link = mysqli_connect("localhost", "root", "", "university_programm_v.1");
 
                // Check connection
                if($link === false)
                {
                    die("ERROR: Could not connect. " . mysqli_connect_error());
                }


                $query1 = "SELECT ID_S FROM student WHERE ID_S='$id'";
                $result1 = mysqli_query($link,$query1);

                $query2 = "SELECT ID_I FROM instructor WHERE ID_I='$id'";
                $result2 = mysqli_query($link,$query2);

                $query3 = "SELECT ID_SEC FROM secreterial WHERE ID_SEC='$id'";
                $result3 = mysqli_query($link,$query3);
                
                $query4 = "SELECT DISTINCT course.NAME,course.NUMBER FROM course ,takes 
                WHERE takes.ID_STUDENT='$id'AND course.NUMBER=takes.COURSE_NO";
                $result4 = mysqli_query($link,$query4);
               
                //Secretelial Interface
                if(mysqli_num_rows($result3) > 0)
                {   
                            echo "<body style=\"background-color:MediumPurple\">";
                            echo "Welcome " . $id;

         
                }//end if secreterial interface

                //Instructor Interface
                if(mysqli_num_rows($result2) > 0)
                {   
                            echo "<body style=\"background-color:CornflowerBlue\">";
                            echo "Welcome " . $id;

        
                }//end if instructors interface
                
                //Student Interface
                if(mysqli_num_rows($result1) > 0)
                {   
                    
                            echo "<body style=\"background-color:pink\">";
                
                            echo "Welcome " . $id . " to Weekly Programm generator Uowm" ;
                            echo" <br>";
                            echo "<hr>";
                            echo "<h3>Choose Courses</h3>";

                            echo "<form action=\"main_website.php\" method=\"POST\" >" ;
                            while($data = mysqli_fetch_array($result4))
                             {           
                             
                                //$data = mysqli_fetch_array($result4);
                                $course_name = $data['NAME'];
                                $course_no = $data['NUMBER'];
                            
                            echo"<input type=\"checkbox\"  name=\"course_list[]\" value=".$course_no."><label>".$course_name."</label>" ;
                            echo" <br>";
                            }

                            echo" <br>";
                            echo "<input type=\"submit\" value=\"submit\">" ;
                            echo "<hr>";
                            echo "</form>";

                            
                                if(!empty($_POST['course_list']))
                                {
                                            echo "<table>";
                                                    echo "<tr>";
                                                        echo "<th >Course</th>";
                                                        echo "<th >Day</th>";
                                                        echo "<th >Time</th>";
                                                        echo "<th >Classroom</th>";
                                                        echo "<th >Instructor</th>";
                                                    echo "</tr>";
                                             echo "</table>";

                                // Loop to store and display values of individual checked checkbox.
                                    foreach($_POST['course_list'] as $list_element)
                                    {
                                   // echo $list_element."<br>";    

                                    $sql = "SELECT course.NAME AS c_name ,time_slots.DAY,time_slots.START_TIME,time_slots.END_TIME,department.NAME AS dep_name,person.SURNAME 
                                            per_surname,person.NAME AS per_name
                                            FROM person,time_slots,teach,department,happen,course
                                            WHERE course.NUMBER='$list_element' AND course.NUMBER=happen.COURSE_NO2 AND course.NUMBER=teach.COURSE_NO AND 
                                            person.ID=teach.ID_INSTRUCTOR AND happen.ID_FAC2=department.ID_FAC AND happen.TIME_SLOT=time_slots.ID ";
                                    if($result = mysqli_query($link, $sql))
                                    {
                                        if(mysqli_num_rows($result) > 0)
                                        {
                                            
                                           for($x=0;$x<mysqli_num_rows($result);$x++)
                                            {
                                                $row = mysqli_fetch_array($result);
                                                echo "<table>";
                                                        echo "<tr>";
                                                            echo "<td >" . $row['c_name'] . "</td>";
                                                            echo "<td >" . $row['DAY'] . "</td>";
                                                            echo "<td >" . $row['START_TIME'] ."-".$row['END_TIME']. "</td>";
                                                            echo "<td >" . $row['dep_name']. "</td>";
                                                            echo "<td >" . $row['per_name']." ".$row['per_surname'] . "</td>";
                                                        echo "</tr>";
                                                
                                            echo "</table>";
                                            } 
                                            // Free result set
                                            mysqli_free_result($result);
                                           
                                        } 
                                        else
                                        {
                                            echo "No records matching your query were found.<br>";
                                        }
                                    }

                                    }//end foreach()
                                }//end if courses
                     
                }//end if student Interface
        ?>
    

    </body>
</html>