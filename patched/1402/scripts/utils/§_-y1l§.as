package utils
{
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import starling.filters.BlurFilter;
   
   public class §_-y1l§
   {
      
      public static const §_-Tk§:Array = [new ColorMatrixFilter([0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0])];
      
      public static const §_-J2O§:Array = [new ColorMatrixFilter([0,0,0,0,0,0,0,0,0,50,0,0,0,0,50,0,0,0,1,50])];
      
      public static const §_-e1O§:Array = [new GlowFilter(16777194,1,15,15,5.5)];
      
      public static const §_-f1F§:Array = [new GlowFilter(47103,0,15,15,5)];
      
      public static const §_-B2P§:Array = [new GlowFilter(16711680,1,7,7,1.5,2)];
      
      private static var §_-rc§:ColorMatrixFilter = null;
      
      private static var §_-H2J§:ColorMatrixFilter = null;
      
      private static var §_-y5§:ColorMatrixFilter = null;
      
      public function §_-y1l§()
      {
         super();
      }
      
      public static function get §_-J1o§() : BlurFilter
      {
         return BlurFilter.§_-J23§(16726579,1,5);
      }
      
      public static function get §_-C1f§() : BlurFilter
      {
         return BlurFilter.§_-J23§(16763955,1,5);
      }
      
      public static function get §_-81G§() : BlurFilter
      {
         return BlurFilter.§_-J23§();
      }
      
      public static function get §_-p1e§() : ColorMatrixFilter
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-rc§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(10,15,0,0);
            §_-rc§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-rc§;
      }
      
      public static function get §_-V1N§() : ColorMatrixFilter
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-H2J§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(-20,0,0,0);
            §_-H2J§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-H2J§;
      }
      
      public static function get §_-Y14§() : ColorMatrixFilter
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-y5§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(-50,0,10,180);
            §_-y5§ = new ColorMatrixFilter(_loc1_);
         }
         return §_-y5§;
      }
   }
}

