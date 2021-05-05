module ApplicationHelper

    def show_sign_in
        out = ''
        out << link_to(link_to('Sign In', login_path)) unless logged_in?
        out.html_safe
      end

      def show_sign_up
        out = ''
        out << link_to(link_to('Sign up', signup_path)) unless logged_in?
        out.html_safe
      end

      def show_sign_out
        out = ''
        out << link_to(link_to('Sign out', signout_path, method: :delete)) if logged_in?
        out.html_safe
      end

      def vote_unvote(article)
        vote = Vote.find_by(article: article, user: current_user)
        if vote
          button_to('unvote!', article_vote_path(id: vote, article_id: article.id), method: :delete)
        else
          button_to('vote!', article_votes_path(id: vote, article_id: article.id))
        end
      end


      def show_article
        content = ''
        articles.each do |post|
          content << "<li class='post'>"
          content << link_to(link_to(post.user.name, user_path(post.user), class: 'post-author'))
          content << content_tag(:div, (render partial: 'posts/like', locals: { post: post }))
          content << content_tag(:p, post.content)
          content << content_tag(:div, (render partial: 'comments/comment', collection: post.comments),
                                 class: 'post-comments-section')
          content << content_tag(:div, (render partial: 'posts/form', locals: { post: post }))
          content << '</li>'
        end
        content.html_safe
      end
end
