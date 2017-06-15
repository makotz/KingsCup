class OptionsController < ApplicationController

  def show
    user = KingsCup.find_by(userID: params[:userID])
    @random_num = user.options.sample
    if @random_num == ("H13" || "S13" || "D13" || "C13")
      user.king_count += 1
      if user.king_count == 4
        render json: @random_num
        return
      end
    end
    user.options.delete(@random_num)
    user.save
    render json: redirect_to_block(@random_num)
  end

  def new
    user = KingsCup.new option_params
    if KingsCup.exists?(userID: user.userID)
      KingsCup.where(userID: user.userID).delete_all
      puts "Deleted"
    end
    card_options = ["H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12","H13","S1","S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12","S13","D1","D2","D3","D4","D5","D6","D7","D8","D9","10","D11","D12","D13","C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13"]
    user.options = card_options
    user.save
  end

  def option_params
    params.permit(:userID, :options)
  end

  def redirect_to_block(blockName)
    @redirect_json = { "redirect_to_blocks": [blockName] }
  end

end
