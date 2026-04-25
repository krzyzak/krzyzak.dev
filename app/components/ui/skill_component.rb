module UI
  class SkillComponent < ApplicationComponent
    TOOLTIP_CLASSES = "hidden w-64 bg-dark border border-green-400/20 rounded-md px-3.5 py-3 font-sans text-xs text-slate-400 leading-relaxed text-left pointer-events-none z-50 whitespace-normal"
    CARET_CLASSES   = "absolute bottom-0 left-1/2 w-2 h-2 bg-dark border-r border-b border-green-400/20"
    CARET_STYLE     = "transform:translateX(-50%) translateY(50%) rotate(45deg)"

    def initialize(name:, description:, style:)
      @name = name
      @description = description
      @style = style.inquiry
    end

    def call
      content_tag(:span, class: pill_classes, data: pill_data) do
        concat name
        concat tooltip_tag
      end
    end

    private

    attr_reader :name, :description, :style

    delegate :primary?, :secondary?, :dotted?, to: :style

    def pill_classes
      class_names(
        "font-mono text-xs px-3.5 py-1 rounded border",
        "text-green-400 bg-green-400/5 border-green-400/20": primary?,
        "text-slate-600 bg-white/5 border-white/5": secondary?,
        "text-slate-700 bg-transparent border-dashed border-slate-700 cursor-pointer relative transition-colors hover:text-green-400 hover:border-green-400/40": dotted?
      )
    end

    def pill_data
      { controller: "tooltip", action: "mouseenter->tooltip#show mouseleave->tooltip#hide" }
    end

    def tooltip_tag
      content_tag(:span, class: TOOLTIP_CLASSES, data: tooltip_data) do
        concat description
        concat caret_tag
      end
    end

    def tooltip_data
      { tooltip_target: "tip" }
    end

    def caret_tag
      content_tag(:span, nil, class: CARET_CLASSES, style: CARET_STYLE)
    end
  end
end
