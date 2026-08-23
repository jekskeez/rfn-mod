package tape
{
   import §_-I10§.§_-3U§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-yU§ extends §_-K2k§
   {
      
      private var §_-ik§:CheckViewImage;
      
      private var button:§_-j18§;
      
      public var §_-X2j§:uint;
      
      public function §_-yU§(param1:String, param2:uint, param3:int)
      {
         super();
         this.§_-X2j§ = param2;
         if(this.§_-X2j§ == §_-3U§.§_-C2j§)
         {
            new §_-Hb§(this,gls("Приглашенный друг должен достичь {0} уровень",Game.§_-L1O§));
         }
         var _loc4_:DisplayObject = new ViralityQuestTapeImage();
         addChild(_loc4_);
         var _loc5_:§_-22V§ = new §_-22V§((param3 + 1).toString() + ".",-24,13,new TextFormat(§_-22V§.§_-pJ§,19,16686345,true));
         _loc5_.filters = [new DropShadowFilter(0,0,16250092,1,6,6,19,1)];
         addChild(_loc5_);
         this.§_-ik§ = new CheckViewImage();
         this.§_-ik§.scaleX = this.§_-ik§.scaleY = 1.5;
         this.§_-ik§.x = 324;
         this.§_-ik§.y = 12;
         addChild(this.§_-ik§);
         _loc5_ = new §_-22V§(param1,7,15,new TextFormat(§_-22V§.§_-F2z§,13,6504987));
         addChild(_loc5_);
         this.button = new §_-j18§(gls("Выполнить").toUpperCase(),90,12);
         this.button.x = 262;
         this.button.y = 11;
         this.button.scaleX = this.button.scaleY = 1.05;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-Lo§);
         if(this.§_-X2j§ != §_-3U§.§_-p1r§)
         {
            addChild(this.button);
         }
      }
      
      private function §_-Lo§(param1:MouseEvent) : void
      {
         §_-3U§.§_-H2m§(this.§_-X2j§);
      }
      
      public function get selected() : Boolean
      {
         return this.§_-ik§.visible;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.button.visible = !param1;
         this.§_-ik§.visible = param1;
      }
   }
}

