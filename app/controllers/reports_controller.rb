class ReportsController < ApplicationController
  def sales_summary
    @year = params[:year].to_i
    @month = params[:month].to_i

    @year = Date.today.year unless @year && @year > 0
    @month = Date.today.month unless @month && @month > 0

    d1 = DateTime.new(@year, @month, 1)
    d2 = d1 + 1.month

    @report = Biz::CostReport.new
    if @report.find_report(@year, @month) > 0
      render :show_report
    elsif params[:commit] == 'gen'
      @report.new_report(@year, @month)
      collection = SalesSheetItem.select('product_id, sum(quantity) as quantity, sum(actual_amount) as actual_amount').where(sales_sheet_id: SalesSheet.where("created_at > ? and created_at < ?", d1, d2)).group(:product_id).includes(:product)
      tot_amount = cost1 = cost2 = profit = 0.00
      tot_quantity = 0
      collection.each do |s|
        tot_amount += s.actual_amount if s.actual_amount
        tot_quantity += s.quantity
        c1 = c2 = 0.0
        p = 0.00
        p = s.actual_amount / s.quantity if s.actual_amount > 0 && s.quantity > 0
        price = s.product.product_price.price.to_d
        @report.new_row
        @report.set_val(0, s.product.full_name)
        @report.set_val(1, s.quantity)
        @report.set_val(2, s.actual_amount)
        @report.set_val(3, p)
        @report.set_val(4, price)
        @report.set_val(5, s.product.product_price.godown_price)
        @report.set_val(6, p / price * 100)
        if s.product.status == 1
          c1 = s.product.product_price.godown_price * s.quantity
          @report.set_val(7, c1)
          cost1 += c1
        else
          @report.set_val(7, 0)
        end
        if s.product.status == 2
          c2 = s.actual_amount * 0.4
          @report.set_val(8, c2)
          cost2 += c2
        else
          @report.set_val(8, 0)
        end
        @report.set_val(9, s.actual_amount - c1 - c2)
        profit += s.actual_amount - c1 - c2
      end
      @report.recaculate
      render :show_report
    else
      @collection = SalesSheetItem.select('product_id, sum(quantity) as quantity, sum(actual_amount) as actual_amount').where(sales_sheet_id: SalesSheet.where("created_at > ? and created_at < ?", d1, d2)).group(:product_id).includes(:product)
    end
  end

  def sales_employee
    @year = params[:year].to_i
    @month = params[:month].to_i

    @year = Date.today.year unless @year && @year > 0
    @month = Date.today.month unless @month && @month > 0

    d1 = DateTime.new(@year, @month, 1)
    d2 = d1 + 1.month
    @collection = SalesSheet.select('operator_id, sum(total_items) as total_items, sum(total_amount) as total_amount, sum(additional_fee) as additional_fee, sum(discount) as discount, sum(actual_amount) as actual_amount').where("created_at > ? and created_at < ?", d1, d2).group(:operator_id)
  end
end

