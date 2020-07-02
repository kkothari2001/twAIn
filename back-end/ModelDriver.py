import gpt_2_simple as gpt2

def truncate(Str):
    return Str[0:Str.rindex(".")+1]

def generate(inputText,genre,length):

    sess = gpt2.start_tf_sess()
    gpt2.load_gpt2(sess, run_name=genre)

    
    Story=gpt2.generate(sess,
                run_name=genre,  
                length=length,
                # temperature=0.7,
                prefix=inputText,
                # nsamples=1,
                # batch_size=1,
                #top_k=40,
                # top_p=0.9,
                include_prefix=True,
                return_as_list=True
                )[0]

    print(Story) # only to make sure the story is generated
    return truncate(Story)

# print(truncate(generate("Suddenly a voice shouted","horror",900)))