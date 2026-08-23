package views
{
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-r16§.§_-22v§;
   import §_-r16§.§_-By§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import tape.§_-xc§;
   
   public class §_-c1t§ extends Sprite
   {
      
      private static const §_-h2m§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,12,16546087);
      
      private static const §_-b23§:GlowFilter = new GlowFilter(14535087,1,10,10);
      
      private var data:§_-xc§ = null;
      
      private var §_-H1q§:§_-22V§ = null;
      
      public function §_-c1t§()
      {
         super();
         this.init();
      }
      
      public function §_-iU§(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = int(§_-vy§.§_-C3T§[§_-vy§.§_-U2M§[param1]["collection"]]["set"][_loc2_]);
            (this.data.objects[_loc2_] as §_-By§).setData(_loc3_,§_-k1C§.§_-G1c§[_loc3_].count,true);
            _loc2_++;
         }
         this.§_-H1q§.text = gls("Коллекция «{0}»",§_-vy§.§_-C3T§[§_-vy§.§_-U2M§[param1]["collection"]]["collectionName"]).toUpperCase();
         this.§_-H1q§.x = 120 - int(this.§_-H1q§.textWidth * 0.5);
      }
      
      private function init() : void
      {
         var _loc3_:§_-By§ = null;
         this.§_-H1q§ = new §_-22V§("",0,0,§_-h2m§);
         addChild(this.§_-H1q§);
         this.data = new §_-xc§();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            _loc3_ = new §_-By§();
            _loc3_.filters = [§_-b23§];
            this.data.§_-yA§(_loc3_);
            _loc1_++;
         }
         var _loc2_:§_-22v§ = new §_-22v§(5,1,0,0,1,0,47,47);
         _loc2_.setData(this.data);
         _loc2_.y = 27;
         addChild(_loc2_);
      }
   }
}

