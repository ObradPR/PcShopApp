export interface CartItem {
  amount: number;
  avg_rating: number;
  count_reviews: number;
  discount_price: number | null;
  discount_value: number | null;
  id_item: number;
  id_product: number;
  item_price: number;
  product_name: string;
  product_price: number;
  saved: number | null;
  src: string;
}
