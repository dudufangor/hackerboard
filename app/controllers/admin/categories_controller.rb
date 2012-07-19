module Admin
  class CategoriesController < AdminController
    def index
      @categories = Category.sorted_by_name
    end

    def remove
      @category = Category.find(params[:id])
    end

    def destroy
      @category = Category.find(params[:id])
      @category.remove!
      redirect_to admin_categories_path, :notice => t("flash.admin.categories.destroy.notice")
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(params[:category])

      if @category.save
        redirect_to admin_categories_path, :notice => t("flash.admin.categories.create.notice")
      else
        render :new
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])

      if @category.update_attributes(params[:category])
        redirect_to admin_categories_path, :notice => t("flash.admin.categories.update.notice")
      else
        render :edit
      end
    end
  end
end
