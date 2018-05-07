class ErrorsController < ApplicationController
    layout false
    def error_404
        render status: 404
    end
end
