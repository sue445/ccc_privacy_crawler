# Helper methods defined here can be accessed in any controller or view in the application

module CccPrivacyCrawler
  class App
    module CompanyHelper
      def jst(time)
        return unless time
        l Time.zone.at(time.to_i)
      end
    end

    helpers CompanyHelper
  end
end
