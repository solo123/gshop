module Biz
  class CostReport < BizBase
    def find_report(year, month)
      @year = year.to_i
      @month = month.to_i
      d = '%04i' % @year << '%02i' % @month
      sr = StaticReport.where('report_type=1 and status=8 and col=0 and row=0 and val=?', d).first
      if sr
        @report_num = sr.id
      else
        0
      end
    end

    def new_report(year, month)
      @year = year
      @month = month
      st = StaticReport.new
      st.row = 0
      st.col = 0
      st.report_type = 1
      st.status = 8
      st.val = '%04i' % year << '%02i' % month
      st.save!
      @report_num = st.id
      @current_row_index = 0
    end

    def new_row
      @current_row_index += 1
    end

    def set_val(col, val)
      st = StaticReport.new
      st.report_num = @report_num
      st.row = @current_row_index
      st.col = col
      st.val = val
      st.report_type = 1
      st.status = 0
      st.save!
    end

    def get_val(col)
      v = StaticReport.where(report_num: @report_num).where(status: 0).where(row: @current_row_index).where(col: col).first
      v.val if v
    end

    def recaculate
    end

    def get_report
      if StaticReport.where(report_num: @report_num).count > 0
        rows = StaticReport.where(report_num: @report_num).last.row
        report_data = Array.new(rows + 1) { Array.new(12) }
        StaticReport.where(report_num: @report_num).each do |dt|
          report_data[dt.row][dt.col] = dt
        end
        report_data
      else
        []
      end
    end

  end
end
