package §_-xr§
{
   import §_-X1k§.§_-Ac§;
   import §_-bN§.Dialog;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-aW§;
   
   public class §_-A3X§ extends Dialog
   {
      
      private static const §_-C1b§:Number = 0.5;
      
      private static const §_-e2p§:Number = 1;
      
      private static const §_-B1X§:Number = 4.5;
      
      private static const §_-k1W§:Number = 5.5;
      
      private static const §_-21n§:GlowFilter = new GlowFilter(1514559,1,5,5);
      
      private static const §_-92m§:GlowFilter = new GlowFilter(0,1,250,125,2,3);
      
      private var id:int = -1;
      
      private var time:Number = 0;
      
      public function §_-A3X§(param1:int)
      {
         super(null,false,false,null,false);
         this.id = param1;
         this.init();
      }
      
      public static function show(param1:int) : void
      {
         new §_-A3X§(param1).show();
      }
      
      override public function show() : void
      {
         super.show();
         this.y = 330;
         §_-p1V§.§_-A3z§(this.§_-t29§);
         this.§_-t29§(0);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-p1V§.§_-DO§(this.§_-t29§);
      }
      
      override protected function placeOnResize() : void
      {
         super.placeOnResize();
         this.y = 330;
      }
      
      private function init() : void
      {
         addChild(new EducationQuestCompleteBack());
         var _loc1_:Object = §_-Ac§.§_-G1x§(this.id);
         var _loc2_:DisplayObject = new (getDefinitionByName(_loc1_["icon"]) as Class)();
         _loc2_.width = _loc2_.height = 58;
         _loc2_.x = 132;
         _loc2_.y = 25;
         addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§(gls("Выполнена миссия:"),0,100,new TextFormat(null,14,16775811,true));
         _loc3_.x = 160 - int(_loc3_.textWidth * 0.5);
         addChild(_loc3_);
         _loc3_ = new §_-i5§(_loc1_["name"],0,130,new TextFormat(§_-i5§.§_-p1s§,18,16777215));
         _loc3_.x = 160 - int(_loc3_.textWidth * 0.5);
         _loc3_.filters = [§_-21n§];
         addChild(_loc3_);
         place();
      }
      
      private function §_-t29§(param1:Number = -1) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(param1 == -1 && !§_-aW§.instance.§_-Bh§)
         {
            return;
         }
         this.time += param1 == -1 ? §_-p1V§.delay : param1;
         if(this.time <= §_-C1b§)
         {
            _loc2_ = this.time / §_-C1b§;
            _loc3_ = 255 * (1 - _loc2_);
            this.filters = [new ColorMatrixFilter([1,0,0,0,_loc3_,0,1,0,0,_loc3_,0,0,1,0,_loc3_,0,0,0,Math.max(1,2 * _loc2_),0])];
         }
         else if(this.time <= §_-e2p§)
         {
            this.filters = [new GlowFilter(0,1,int(250 * (this.time / §_-e2p§)),int(125 * (this.time / §_-e2p§)),2,3)];
         }
         if(this.time > §_-e2p§)
         {
            this.filters = [§_-92m§];
         }
         if(this.time >= §_-B1X§)
         {
            this.alpha = Math.max(0,§_-k1W§ - this.time);
         }
         if(this.time >= §_-k1W§)
         {
            this.hide();
         }
      }
   }
}

