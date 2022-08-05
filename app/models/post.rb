class Post < ApplicationRecord

    validates :title, presence: true
    # ,  uniqueness: { case_sensitive: true }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, :inclusion => {:in => ["Fiction", "Non-Fiction"]}
    # validate :title_is_clickbait
    validate :true_facts_method

    def true_facts_method 

        titles_allowed = ["Won't Believe", "Secret", "Top [number]", "Guess"]

        # validate :title_is_clickbait
        # def title_is_clickbait
        #     if ["Won't Believe", "Secret", "Top [number]", "Guess"].none? {|string| title && title.include?(string)}
        #         errors.add(:title, "needs more juice")
        #     end
        # end
        
        # titles_allowed.each do |str| 
        #    if !title&.include? str
        #     errors.add(:title, "not acceptable")
        #    end 
        # end 

       v = titles_allowed.none? { |string| title && title.include?(string) }

       if v 
         erros.add(:title, "not acceptable")
       end 
    end 


    def title_is_clickbait
        if ["Won't Believe", "Secret", "Top [number]", "Guess"].none? {|string| title && title.include?(string)}
            errors.add(:title, "needs more juice")
        end
    end

end
