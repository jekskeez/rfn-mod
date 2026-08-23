package §_-Yb§
{
   import §_-D1c§.§_-c1n§;
   
   public class §_-R2b§ extends §_-h10§
   {
      
      public function §_-R2b§()
      {
         super();
         §_-XG§(new §_-c1n§(gls("Трение {0}","(friction)"),"friction"));
         §_-XG§(new §_-c1n§(gls("Упругость {0}","(restitution)"),"restitution"));
         §_-XG§(new §_-c1n§(gls("Плотность {0}","(density)"),"density",1,1));
      }
      
      override public function get height() : Number
      {
         return super.§_-7e§;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
      }
   }
}

