package views
{
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-w2v§;
   import utils.§_-x1Z§;
   
   public class §_-13m§ extends Sprite
   {
      
      private static const §_-b23§:GlowFilter = new GlowFilter(16776960,1,3,3,1);
      
      private static const §_-dy§:GlowFilter = new GlowFilter(10027212,1,3,3,1);
      
      private var §_-Y1t§:§_-w2v§;
      
      private var §_-q1c§:ExperienceBarImage = new ExperienceBarImage();
      
      private var §_-F25§:ExperienceBarDoubleImage = new ExperienceBarDoubleImage();
      
      private var §_-I2K§:Boolean = false;
      
      private var §_-93E§:uint;
      
      public function §_-13m§()
      {
         super();
         this.init();
      }
      
      public function set §_-h1Z§(param1:Boolean) : void
      {
         this.§_-I2K§ = param1;
         this.§_-Y1t§.§_-vm§(param1 ? this.§_-F25§ : this.§_-q1c§,0,0);
      }
      
      public function get §_-h1Z§() : Boolean
      {
         return this.§_-I2K§;
      }
      
      public function §_-h1E§() : void
      {
         this.§_-93E§ = §_-d2x§.§_-e9§;
         this.§_-Y1t§.§_-B1n§(§_-My§.§_-M1a§(§_-d2x§.§_-s2O§) - this.§_-93E§,§_-My§.§_-M1a§(§_-d2x§.§_-s2O§));
      }
      
      private function init() : void
      {
         var _loc1_:ExperienceBarImage = new ExperienceBarImage();
         _loc1_.filters = §_-x1Z§.§_-jD§;
         this.§_-q1c§.filters = [§_-b23§];
         this.§_-F25§.filters = [§_-dy§];
         this.§_-Y1t§ = new §_-w2v§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":this.§_-q1c§,
            "X":0,
            "Y":0
         }],70,true);
         addChild(this.§_-Y1t§);
      }
   }
}

