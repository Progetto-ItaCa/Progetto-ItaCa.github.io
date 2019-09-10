<form method="POST" action="submissions/create.php">
     <label>
       Name:<br>
       <input name="name" type="text" required>
     </label>
     <label>
       Title:<br>
       <input name="title" type="text" required>
     </label>
     <label>
       Abstract:<br>
       <textarea name="abstract"></textarea>
     </label>
     <label>
       Contact (your email):<br>
       <input name="email" type="email" required>
     </label>
     <label>
       Arrival:<br>
       <input name="arrival" type="date" required>
     </label>
     <label>
       Departure:<br>
       <input name="departure" type="date" required>
     </label>
     <br />
     <input type="submit" value="Submit">
 </form>
