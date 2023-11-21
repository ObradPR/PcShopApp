export interface Category {
  id_category: number;
  category_name: string;
  category_description?: string;
  popular?: boolean;
  id_parent?: number;
  id_cat_parent?: number;
  src?: string;
  product_count?: number;
}
