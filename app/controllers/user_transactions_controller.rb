class UserTransactionsController < ApplicationController
  #Permanant address for the test api merchant
  TEST_MERCH_ID = "58a8e6251756fc834d9053df"

  def listAll
    @payments = Payment.all
    @uid = params[:uid]
  end

  def vote
    val = params[:val]
    uid = params[:uid]
    payid = params[:payid]
    v = Vote.all.where(user_id:uid, payment_id:payid).first
    if v
      v.value = val
      v.save
    else
      v = Vote.create(value:val, user_id:uid, payment_id:payid)
    end
    p = v.payment
    if (1.0 * p.vote.where(value:1).count / p.cause.users.count) > 0.50
      Purchase.createPurchase(p.cause.accid,
                              {"merchant_id": TEST_MERCH_ID,
                               "medium": "balance",
                               "amount": p.amt,
                               "description": p.desc});0
      flash.notice = 'Successfully made purchase: "' + p.title + '" to merchant id ' + TEST_MERCH_ID
    end
    redirect_to root_url(:uid=>(uid.to_i+1).to_s)
  end
end
