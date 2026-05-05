module UI
  class OpenSourceCardComponent < ApplicationComponent
    def initialize(repo:, description:, tags:, role: :author, shortcut: nil)
      @repo = repo
      @description = description
      @tags = tags
      @role = role
      @shortcut = shortcut
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

    def link_options
      {
        target: "_blank",
        rel: "noopener noreferrer",
        aria: { label: "#{repo} — #{description} (opens in new tab)" },
        data: shortcut ? { oss_target: shortcut.downcase } : {},
        class: "group block bg-white/[2.5%] border border-white/10 rounded-lg px-4 py-4 no-underline transition-all hover:bg-white/5 hover:border-green-400/20"
      }
    end

    def tag_pill(tag)
      content_tag(:span, tag, class: class_names("font-mono text-2xs text-slate-600 bg-white/5 border border-white/5 px-2 py-0.5 rounded-sm"))
    end

    private

    attr_reader :repo, :description, :tags, :role, :shortcut

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
