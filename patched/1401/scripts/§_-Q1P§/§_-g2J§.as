package §_-Q1P§
{
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class §_-g2J§ extends Dialog
   {
      
      private var §_-V2b§:Function;
      
      private var §_-o23§:Function;
      
      private var §_-U0§:Function;
      
      public function §_-g2J§(param1:Function, param2:Function, param3:Function)
      {
         super(gls("Выход"),true,false);
         this.§_-V2b§ = param1;
         this.§_-o23§ = param2;
         this.§_-U0§ = param3;
         var _loc4_:§_-22V§ = new §_-22V§(gls("Вы уверены, что хотите выйти без сохранения изменений?"),20,10,new TextFormat(null,14,0,null));
         addChild(_loc4_);
         var _loc5_:§_-j18§ = new §_-j18§(gls("Сохранить"));
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-D1w§);
         var _loc6_:§_-j18§ = new §_-j18§(gls("Не сохранять"));
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-y1U§);
         var _loc7_:§_-j18§ = new §_-j18§(gls("Отмена"));
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-K1H§);
         place(_loc5_,_loc6_,_loc7_);
         this.height += 80;
      }
      
      override protected function effectOpen() : void
      {
      }
      
      private function §_-D1w§(param1:MouseEvent) : void
      {
         this.§_-V2b§();
         Mouse.cursor = MouseCursor.AUTO;
         hide();
      }
      
      private function §_-y1U§(param1:MouseEvent) : void
      {
         this.§_-o23§();
         Mouse.cursor = MouseCursor.AUTO;
         hide();
      }
      
      private function §_-K1H§(param1:MouseEvent) : void
      {
         this.§_-U0§();
         hide();
      }
   }
}

