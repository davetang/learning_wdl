version 1.0

# Optional parameters are declared by including a question mark (?) at the end
# of the type declaration, e.g. String?. If a value for an optional parameter
# is specified in the JSON file, its value will be propagated, otherwise it
# will be empty. We can use this to generalise WDL tasks; if a parameter is
# defined in the JSON file, it can be used to specify optional parameters

workflow opt_test {

   call echo {}

}

task echo {

   input {

      String outfile
      String my_word
      Boolean my_true
      Boolean my_false
      String? my_second_word
      String? my_other_word
      Int? my_int

   }

   command <<<

      set -euo pipefail

      echo "[~{my_word}] [~{my_second_word}]" > ~{outfile}

      # one way to include optional parameters
      echo ~{"my_second_word is [" + my_second_word + "]"} >> ~{outfile}

      # another way using defined which can be used with if-else
      echo ~{if defined(my_other_word) then "[~{my_other_word}] is defined" else "my_other_word is not defined"} >> ~{outfile}

      echo ~{if my_true then "my_true is [~{my_true}]" else "my_true is false"} >> ~{outfile}
      echo ~{if my_false then "my_false is [~{my_false}]" else "my_false is false"} >> ~{outfile}

      echo "integer = [~{my_int}]" >> ~{outfile}

   >>>

   output {

      File output_file = "~{outfile}"

   }

}

