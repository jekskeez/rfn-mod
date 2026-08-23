package views
{
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-8p§;
   import utils.§_-y1l§;
   
   public class §_-032§ extends Sprite
   {
      
      private static const §_-21n§:GlowFilter = new GlowFilter(16776960,1,3,3,1);
      
      private static const §_-61D§:GlowFilter = new GlowFilter(10027212,1,3,3,1);
      
      private var §_-hX§:§_-8p§;
      
      private var §_-K1i§:ExperienceBarImage = new ExperienceBarImage();
      
      private var §_-b2M§:ExperienceBarDoubleImage = new ExperienceBarDoubleImage();
      
      private var §_-O2r§:Boolean = false;
      
      private var §_-lP§:uint;
      
      public function §_-032§()
      {
         super();
         this.init();
      }
      
      public function set §_-R1O§(param1:Boolean) : void
      {
         this.§_-O2r§ = param1;
         this.§_-hX§.§_-o2S§(param1 ? this.§_-b2M§ : this.§_-K1i§,0,0);
      }
      
      public function get §_-R1O§() : Boolean
      {
         return this.§_-O2r§;
      }
      
      public function §_-1S§() : void
      {
         this.§_-lP§ = §_-LZ§.§_-02R§;
         this.§_-hX§.§_-d1Z§(§_-XW§.§_-23§(§_-LZ§.§_-v1§) - this.§_-lP§,§_-XW§.§_-23§(§_-LZ§.§_-v1§));
      }
      
      private function init() : void
      {
         var _loc1_:ExperienceBarImage = new ExperienceBarImage();
         _loc1_.filters = §_-y1l§.§_-J2O§;
         this.§_-K1i§.filters = [§_-21n§];
         this.§_-b2M§.filters = [§_-61D§];
         this.§_-hX§ = new §_-8p§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":this.§_-K1i§,
            "X":0,
            "Y":0
         }],70,true);
         addChild(this.§_-hX§);
      }
   }
}

