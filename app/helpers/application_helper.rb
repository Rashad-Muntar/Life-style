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
end
