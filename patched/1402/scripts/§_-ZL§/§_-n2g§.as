package §_-ZL§
{
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class §_-n2g§ extends Dialog
   {
      
      private var §_-93t§:Function;
      
      private var §_-x2m§:Function;
      
      private var §_-Jc§:Function;
      
      public function §_-n2g§(param1:Function, param2:Function, param3:Function)
      {
         super(gls("Выход"),true,false);
         this.§_-93t§ = param1;
         this.§_-x2m§ = param2;
         this.§_-Jc§ = param3;
         var _loc4_:§_-i5§ = new §_-i5§(gls("Вы уверены, что хотите выйти без сохранения изменений?"),20,10,new TextFormat(null,14,0,null));
         addChild(_loc4_);
         var _loc5_:§_-K2G§ = new §_-K2G§(gls("Сохранить"));
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-HQ§);
         var _loc6_:§_-K2G§ = new §_-K2G§(gls("Не сохранять"));
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-X2l§);
         var _loc7_:§_-K2G§ = new §_-K2G§(gls("Отмена"));
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-m5§);
         place(_loc5_,_loc6_,_loc7_);
         this.height += 80;
      }
      
      override protected function effectOpen() : void
      {
      }
      
      private function §_-HQ§(param1:MouseEvent) : void
      {
         this.§_-93t§();
         Mouse.cursor = MouseCursor.AUTO;
         hide();
      }
      
      private function §_-X2l§(param1:MouseEvent) : void
      {
         this.§_-x2m§();
         Mouse.cursor = MouseCursor.AUTO;
         hide();
      }
      
      private function §_-m5§(param1:MouseEvent) : void
      {
         this.§_-Jc§();
         hide();
      }
   }
}

