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

  def show_article_in_cat
    content = ''
    @category.articles.each do |article|
      content << "<div class='cat-card'>"
      content << image_tag(article.image) if article.image.attached?
      content << "<div class='cat-card-content'>"
      content << link_to(article.title, article)
      content << content_tag(:p, article.text)
      content << '</div>'
      content << '</div>'
    end
    content.html_safe
  end

  def category_article_link(category)
    return unless category.articles.any?

    link_title = category.articles.pluck(:title).last.truncate(27)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'link-title underline')
  end

  def show_featured
    content = ''
    @featured.each do |category|
      content << "<div class='index-cat-card'>"
      content << content_tag(:p, category.name)
      content << image_tag(category.articles.last.image)
      content << content_tag(:p, category.articles.pluck(:title).last)
      content << '</div>'
    end
    content.html_safe
  end

  def header_article_show
    content = ''
    voteChecker = 0
    heighest = ''
    @articles.each do |article|
      if article.votes.length > voteChecker
        voteChecker = article.votes.count
        heighest = article
      end
    end
    content << "<div class='header-img-wrapper'>"
    if heighest.image.attached?
      content << image_tag(heighest.image, class: 'header-img') do
        content << content_tag(:span, heighest.category.name, class: 'img-cat')
        content << content_tag(:span, heighest.title, class: 'heighest.title')
      end
      content << '</div>'
    end
    content.html_safe
  end

  def show_cat_links
    content = ''
    @categories.each do |category|
      content << link_to(category.name.upcase, category, class: 'categories')
    end
    content.html_safe
  end
end
