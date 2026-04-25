module UI
  class OpenSourceCardComponent < ApplicationComponent
    def initialize(repo:, description:, tags:, role: :author)
      @repo = repo
      @description = description
      @tags = tags
      @role = role
    end

    def url
      author? ? repo_url : "#{repo_url}/commits?author=krzyzak"
    end

    def repo_name
      content_tag(:span, repo, class: class_names("font-mono text-xs font-semibold", "text-green-400": author?, "text-slate-400": contributor?))
    end

    def role_badge
      content_tag(:span, role_badge_text, class: class_names(
        "font-mono text-3xs font-bold px-1.5 py-0.5 rounded-sm whitespace-nowrap border transition-all",
        "text-green-400/60 bg-green-400/10 border-green-400/15 group-hover:bg-green-400 group-hover:text-midnight group-hover:border-transparent": author?,
        "text-violet-400/50 bg-violet-400/5 border-violet-400/10 group-hover:bg-violet-400/10 group-hover:border-violet-400/25 group-hover:text-violet-400": contributor?
      ))
    end

    def tag_pill(tag)
      content_tag(:span, tag, class: class_names("font-mono text-2xs text-slate-600 bg-white/5 border border-white/5 px-2 py-0.5 rounded-sm"))
    end

    private

    attr_reader :repo, :description, :tags, :role

    def repo_url
      "https://github.com/#{repo}"
    end

    def role_badge_text
      author? ? "AUTHOR" : "CONTRIB"
    end

    def author?
      role == "author"
    end

    def contributor?
      !author?
    end
  end
end
