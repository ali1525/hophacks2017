module UserTransactionsHelper
  def get_up_percent(payment)
    if payment.vote.first
      "%.2f%%" % (100.0 * payment.vote.where(value: 1).count / payment.cause.users.count)
    end
  end
  def get_down_percent(payment)
    if payment.vote.first
      "%.2f%%" % (100.0 * payment.vote.where(value: -1).count / payment.cause.users.count)
    end
  end

end
