package views
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import §_-wJ§.§_-2e§;
   import §_-wJ§.§_-q2U§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import tape.§_-h2f§;
   
   public class §_-pv§ extends Sprite
   {
      
      private static const §_-m2n§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,12,16546087);
      
      private static const §_-21n§:GlowFilter = new GlowFilter(14535087,1,10,10);
      
      private var data:§_-h2f§ = null;
      
      private var §_-r2A§:§_-i5§ = null;
      
      public function §_-pv§()
      {
         super();
         this.init();
      }
      
      public function §_-J2m§(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = int(§_-42H§.§_-V10§[§_-42H§.§_-U13§[param1]["collection"]]["set"][_loc2_]);
            (this.data.objects[_loc2_] as §_-2e§).setData(_loc3_,§_-WS§.§_-2P§[_loc3_].count,true);
            _loc2_++;
         }
         this.§_-r2A§.text = gls("Коллекция «{0}»",§_-42H§.§_-V10§[§_-42H§.§_-U13§[param1]["collection"]]["collectionName"]).toUpperCase();
         this.§_-r2A§.x = 120 - int(this.§_-r2A§.textWidth * 0.5);
      }
      
      private function init() : void
      {
         var _loc3_:§_-2e§ = null;
         this.§_-r2A§ = new §_-i5§("",0,0,§_-m2n§);
         addChild(this.§_-r2A§);
         this.data = new §_-h2f§();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            _loc3_ = new §_-2e§();
            _loc3_.filters = [§_-21n§];
            this.data.§_-LF§(_loc3_);
            _loc1_++;
         }
         var _loc2_:§_-q2U§ = new §_-q2U§(5,1,0,0,1,0,47,47);
         _loc2_.setData(this.data);
         _loc2_.y = 27;
         addChild(_loc2_);
      }
   }
}

