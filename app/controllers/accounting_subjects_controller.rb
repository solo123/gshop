class AccountingSubjectsController < ResourcesController
	private
		def accounting_subject_params
			params.require(:accounting_subject).permit(:short_code, :status, :title)
		end
end
