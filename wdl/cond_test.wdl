version 1.0

# In this workflow, we are testing a conditional task execution. The hello task
# will only execute when say_hello is true. In addition, the bye task will use
# the output of the hello task only if it exists, by using the select_first()
# function; this will create an output with hello at the start. If the hello
# task was not executed because say_hello was false, then the bye task will use
# outfile, which will only contain the word "bye".

workflow cond_task {

   input {
      Boolean say_hello
      String outfile
   }

   if (say_hello){
      call echo as hello {
         input:
           outfile = outfile,
           word = "hello"
      }
   }

   call echo as bye {
      input:
        outfile = select_first([hello.txt, outfile]),
        word = "bye"
   }

}

task echo {

   input {
      String word
      String outfile
   }

   String outfile_base = basename(outfile)

   command <<<
      cat <(cat ~{outfile}) <(echo ~{word}) > ~{outfile_base}
   >>>

   output {
      File txt = "~{outfile_base}"
   }

}

