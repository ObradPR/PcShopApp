export interface WishlistItem {
  avg_rating: number;
  count_reviews: number;
  discount_price: number | null;
  discount_value: number | null;
  product_description: string | null;
  product_name: string;
  product_price: number;
  saved: number | null;
  src: string;
  wishlist_date: string;
  id_product: number;
}
