## 1. 新建询单
# 1.1 查找产品
@product = Product.first

# 1.2 建立询单对象
@customer = Customer.first
@enquiry = @customer.enquiries.new(:product => @product,:amount => 100)
@enquiry.comment = "here is a comment"
@enquiry.get_available_partners
@enquiry.save!

# 1.3询单分发
@enquiry.dispatch
@enquiry.state

## 2. 经理分配询单
current_user = Staff.first
@my_company = current_user.company
@reply = @my_company.replies.first
#@place = ?? #从views下拉获取
#@branch = @my_company.branches.where(:place => @place).first
#@advisor = @branch.advisors.where(:id => ??)
#@reply.advisor = @advisor
@reply.assign_advisor(current_user)
@reply.state


## 3. 顾问填写询单
#@reply = current_user.replies.where(:state => :assigned).first
@reply = current_user.replies.first
@reply[:amount] = 1000
@reply[:percent] = 0.1
#@reply.meeting = "Monday....."
@reply.save!

## 4. 回执被发回客户
@reply.answer
@reply.state

## 5. 顾客选择回执
current_user =   Customer.first
@reply = current_user.enquiries.first.replies.first

#@reply.meeting #显示约会
# 其他显示
@reply.choice #@reply.reject

#@enquiry.replies.count = @enquiry.answerd_replies_count