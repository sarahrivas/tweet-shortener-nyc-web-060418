require 'pry'
def dictionary 
  word_substitute = { 
  "hello" => "hi",
  "to, two, too" => '2', 
  "for, four" => '4',
  'be' => 'b',
  'you' => 'u',
  "at" => "@" ,
  "and" => "&"
}
end
  
def word_substituter(tweet)
  word_sub_hash = dictionary
  updated_string = ""
  tweet_array = tweet.split(" ")
  tweet_array.each do |word| 
    replaced = false;
    word_sub_hash_keys_array = word_sub_hash.keys
    word_sub_hash_keys_array.each do |word_sub|
      all_word_subs = word_sub.split(", ")
      if (all_word_subs.include? word.downcase)
        updated_string << "#{word_sub_hash[word_sub]} "
        replaced = true
      end
    end
    if (!replaced) 
      updated_string << "#{word} "
    end
    replaced = false
  end
  updated_string.chomp(' ')
end

def bulk_tweet_shortener(array_tweets)
  array_tweets.each do |tweets|
    puts word_substituter(tweets)
  end    
end  

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else   
    tweet
  end  
end  

def shortened_tweet_truncator(tweet)
  revised_tweet = word_substituter(tweet)
  if revised_tweet.length > 140
    revised_tweet[0..139]
  end  
end  
    

