export interface FeaturedProduct {
  discount_price: number;
  discount_value: number;
  id_product: number;
  priority: number;
  product_name: string;
  product_price: number;
  saved: number;
  src: string;
  tag_names: string | string[];
  in_wishlist: boolean;
}
