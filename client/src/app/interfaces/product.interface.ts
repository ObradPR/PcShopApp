export interface Product {
  avg_rating: number;
  brand_name: string;
  category_name: string;
  discount_price: number | null;
  discount_value: number | null;
  id_brand: number;
  id_category: number;
  id_product: number;
  in_wishlist: boolean;
  product_name: string;
  product_price: number;
  saved: number | null;
  src: string;
  tag_names: string[] | string | null;
}
