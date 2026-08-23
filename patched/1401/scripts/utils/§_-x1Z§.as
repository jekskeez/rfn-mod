package utils
{
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import starling.filters.BlurFilter;
   
   public class §_-x1Z§
   {
      
      public static const §_-c2G§:Array = [new ColorMatrixFilter([0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0])];
      
      public static const §_-jD§:Array = [new ColorMatrixFilter([0,0,0,0,0,0,0,0,0,50,0,0,0,0,50,0,0,0,1,50])];
      
      public static const §_-k1X§:Array = [new GlowFilter(16777194,1,15,15,5.5)];
      
      public static const §_-T1w§:Array = [new GlowFilter(47103,0,15,15,5)];
      
      public static const §_-73n§:Array = [new GlowFilter(16711680,1,7,7,1.5,2)];
      
      private static var §_-XB§:ColorMatrixFilter = null;
      
      private static var §_-337§:ColorMatrixFilter = null;
      
      private static var §_-nM§:ColorMatrixFilter = null;
      
      public function §_-x1Z§()
      {
         super();
      }
      
      public static function get §_-m1p§() : BlurFilter
      {
         return BlurFilter.§_-q2e§(16726579,1,5);
      }
      
      public static function get §_-VJ§() : BlurFilter
      {
         return BlurFilter.§_-q2e§(16763955,1,5);
      }
      
      public static function get §_-83w§() : BlurFilter
      {
         return BlurFilter.§_-q2e§();
      }
      
      public static function get §_-w1t§() : ColorMatrixFilter
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-XB§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(10,15,0,0);
            §_-XB§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-XB§;
      }
      
      public static function get §_-H23§() : ColorMatrixFilter
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-337§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(-20,0,0,0);
            §_-337§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-337§;
      }
      
      public static function get §_-J1U§() : ColorMatrixFilter
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-nM§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(-50,0,10,180);
            §_-nM§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-nM§;
      }
   }
}

