class AdminMailer < ApplicationMailer
    default from: 'no-reply@thecatproject.fr'

    def order_email(admin)
        @admin = admin

        #@url = 'http://thecatproject.fr/admmin'

        mail(to: @admin.email, subject: 'HEHO')
    end
end
