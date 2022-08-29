version 1.0

workflow py_test {

   call python_code{}

}

task python_code {

   input {

      String word = "Hello"

   }

   command <<<

      python3 <<CODE
      with open("test.txt", "w") as outfile:
          outfile.write("~{word}\n")
      CODE

   >>>

   output {

      File txt = "test.txt"

   }

}

