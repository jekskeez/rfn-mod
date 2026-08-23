package tape
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-Q2l§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-X2Q§ extends §_-QN§
   {
      
      private var §_-j1j§:CheckViewImage;
      
      private var button:§_-K2G§;
      
      public var §_-k2N§:uint;
      
      public function §_-X2Q§(param1:String, param2:uint, param3:int)
      {
         super();
         this.§_-k2N§ = param2;
         if(this.§_-k2N§ == §_-Q2l§.§_-Re§)
         {
            new §_-kr§(this,gls("Приглашенный друг должен достичь {0} уровень",Game.§_-Bq§));
         }
         var _loc4_:DisplayObject = new ViralityQuestTapeImage();
         addChild(_loc4_);
         var _loc5_:§_-i5§ = new §_-i5§((param3 + 1).toString() + ".",-24,13,new TextFormat(§_-i5§.§_-p1s§,19,16686345,true));
         _loc5_.filters = [new DropShadowFilter(0,0,16250092,1,6,6,19,1)];
         addChild(_loc5_);
         this.§_-j1j§ = new CheckViewImage();
         this.§_-j1j§.scaleX = this.§_-j1j§.scaleY = 1.5;
         this.§_-j1j§.x = 324;
         this.§_-j1j§.y = 12;
         addChild(this.§_-j1j§);
         _loc5_ = new §_-i5§(param1,7,15,new TextFormat(§_-i5§.§_-c10§,13,6504987));
         addChild(_loc5_);
         this.button = new §_-K2G§(gls("Выполнить").toUpperCase(),90,12);
         this.button.x = 262;
         this.button.y = 11;
         this.button.scaleX = this.button.scaleY = 1.05;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-71m§);
         if(this.§_-k2N§ != §_-Q2l§.§_-gg§)
         {
            addChild(this.button);
         }
      }
      
      private function §_-71m§(param1:MouseEvent) : void
      {
         §_-Q2l§.§_-XZ§(this.§_-k2N§);
      }
      
      public function get selected() : Boolean
      {
         return this.§_-j1j§.visible;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.button.visible = !param1;
         this.§_-j1j§.visible = param1;
      }
   }
}

