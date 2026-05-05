module UI
  class ExperienceItemComponent < ApplicationComponent
    def initialize(company:, role:, description:, featured: false, shortcut: nil)
      @company = company
      @role = role
      @description = description
      @featured = featured
      @shortcut = shortcut
    end

    def call
      content_tag(:div, class: item_classes, data: { accordion_target: "item" }) do
        concat trigger_tag
        concat body_tag
      end
    end

    private

    attr_reader :company, :role, :description, :featured, :shortcut

    alias featured? featured

    def item_classes
      class_names("acc-item border-b border-white/5", "open": featured?)
    end

    def trigger_classes
      class_names("acc-trigger w-full border-0 cursor-pointer px-6 py-3.5 flex items-center justify-between gap-2 text-left", "bg-green-400/5": featured?, "bg-transparent": !featured?)
    end

    def trigger_tag
      content_tag(:button, class: trigger_classes,
                  aria: { expanded: featured?.to_s, controls: body_id },
                  data: { action: "click->accordion#toggle" }) do
        concat company_tag
        concat right_tag
      end
    end

    def right_tag
      content_tag(:div, class: "flex items-center gap-2 shrink-0") do
        concat kbd_tag if shortcut
        concat arrow_tag
      end
    end

    def kbd_tag
      content_tag(:kbd, shortcut, class: "font-mono text-2xs text-slate-600 bg-white/[3%] border border-white/[8%] px-1.5 py-0.5 rounded leading-none")
    end

    def company_tag
      content_tag(:div, class: "flex flex-col gap-1") do
        concat content_tag(:span, company, class: class_names("font-sans text-sm font-semibold", "text-slate-50": featured?, "text-slate-400": !featured?))
        concat content_tag(:span, role, class: class_names("font-mono text-xs", "text-green-400": featured?, "text-slate-500": !featured?))
      end
    end

    def arrow_tag
      content_tag(:span, "▾", class: class_names("acc-arrow font-mono text-sm shrink-0", "text-green-400": featured?, "text-slate-700": !featured?), style: featured? ? "transform:rotate(0deg)" : nil)
    end

    def body_tag
      content_tag(:div, id: body_id, class: class_names("acc-body ml-5 pl-4 pr-6", "open": featured?), style: featured? ? "padding-bottom:16px" : nil) do
        content_tag(:p, description, class: "font-sans text-xs text-slate-400 leading-relaxed m-0")
      end
    end

    def body_id
      "exp-#{company.parameterize}-body"
    end
  end
end
