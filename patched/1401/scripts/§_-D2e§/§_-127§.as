package §_-D2e§
{
   import §_-I10§.§_-Q2v§;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-Vm§;
   
   public class §_-127§ extends Dialog
   {
      
      private static const §_-Zk§:Number = 0.5;
      
      private static const §_-52b§:Number = 1;
      
      private static const §_-L1h§:Number = 4.5;
      
      private static const §_-Zq§:Number = 5.5;
      
      private static const §_-b23§:GlowFilter = new GlowFilter(1514559,1,5,5);
      
      private static const §_-X1h§:GlowFilter = new GlowFilter(0,1,250,125,2,3);
      
      private var id:int = -1;
      
      private var time:Number = 0;
      
      public function §_-127§(param1:int)
      {
         super(null,false,false,null,false);
         this.id = param1;
         this.init();
      }
      
      public static function show(param1:int) : void
      {
         new §_-127§(param1).show();
      }
      
      override public function show() : void
      {
         super.show();
         this.y = 330;
         §_-01Y§.§_-h1R§(this.§_-H5§);
         this.§_-H5§(0);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-01Y§.§_-t1s§(this.§_-H5§);
      }
      
      override protected function placeOnResize() : void
      {
         super.placeOnResize();
         this.y = 330;
      }
      
      private function init() : void
      {
         addChild(new EducationQuestCompleteBack());
         var _loc1_:Object = §_-Q2v§.§_-d2I§(this.id);
         var _loc2_:DisplayObject = new (getDefinitionByName(_loc1_["icon"]) as Class)();
         _loc2_.width = _loc2_.height = 58;
         _loc2_.x = 132;
         _loc2_.y = 25;
         addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§(gls("Выполнена миссия:"),0,100,new TextFormat(null,14,16775811,true));
         _loc3_.x = 160 - int(_loc3_.textWidth * 0.5);
         addChild(_loc3_);
         _loc3_ = new §_-22V§(_loc1_["name"],0,130,new TextFormat(§_-22V§.§_-pJ§,18,16777215));
         _loc3_.x = 160 - int(_loc3_.textWidth * 0.5);
         _loc3_.filters = [§_-b23§];
         addChild(_loc3_);
         place();
      }
      
      private function §_-H5§(param1:Number = -1) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(param1 == -1 && !§_-Vm§.instance.§_-g1G§)
         {
            return;
         }
         this.time += param1 == -1 ? §_-01Y§.delay : param1;
         if(this.time <= §_-Zk§)
         {
            _loc2_ = this.time / §_-Zk§;
            _loc3_ = 255 * (1 - _loc2_);
            this.filters = [new ColorMatrixFilter([1,0,0,0,_loc3_,0,1,0,0,_loc3_,0,0,1,0,_loc3_,0,0,0,Math.max(1,2 * _loc2_),0])];
         }
         else if(this.time <= §_-52b§)
         {
            this.filters = [new GlowFilter(0,1,int(250 * (this.time / §_-52b§)),int(125 * (this.time / §_-52b§)),2,3)];
         }
         if(this.time > §_-52b§)
         {
            this.filters = [§_-X1h§];
         }
         if(this.time >= §_-L1h§)
         {
            this.alpha = Math.max(0,§_-Zq§ - this.time);
         }
         if(this.time >= §_-Zq§)
         {
            this.hide();
         }
      }
   }
}

