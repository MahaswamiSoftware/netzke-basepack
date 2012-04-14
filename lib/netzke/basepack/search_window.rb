module Netzke
  module Basepack
    class SearchWindow < Netzke::Basepack::Window

      action :search do |a|
        a.text = I18n.t('netzke.basepack.search_window.action.search')
      end

      action :cancel do |a|
        a.text = I18n.t('netzke.basepack.search_window.action.search')
      end

      js_properties :width => "50%",
                    :auto_height => true,
                    :close_action => "hide",
                    :buttons => [:search, :cancel],
                    :modal => true

      def configure
        super
        config.items = [:search_panel.component(:prevent_header => true)]
        config.title = I18n.t('netzke.basepack.search_window.title')
        config.persistence = false
      end

      component :search_panel do
        {
          :class_name => "Netzke::Basepack::QueryBuilder",
          :model => config[:model],
          :fields => config[:fields]
        }
      end

      js_method :init_component, <<-JS
        function(){
          this.callParent();

          this.on('show', function(){
            this.closeRes = 'cancel';
          });
        }
      JS

      js_method :get_query, <<-JS
        function(){
          return this.items.first().getQuery();
        }
      JS

      js_method :on_search, <<-JS
        function(){
          this.closeRes = 'search';
          this.hide();
        }
      JS

      js_method :on_cancel, <<-JS
        function(){
          this.hide();
        }
      JS

    end
  end
end
