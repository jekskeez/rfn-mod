package §_-xr§
{
   import §_-bN§.Dialog;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-j1X§ extends Dialog
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,15,7625799,true);
      
      public function §_-j1X§()
      {
         super(gls("Добро пожаловать в трагедию белок!"),true,false,null,false);
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         §_-si§.§_-41R§ = false;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         var e:MouseEvent = param1;
         super.hide();
         §_-si§.§_-41R§ = true;
         §_-U2d§.load(function():void
         {
            §_-t2c§.show("Learning");
         },false,true);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,24,16763904,null,null,null,null,null,"center");
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.3);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      private function init() : void
      {
         var _loc1_:EducationWelcomeImage = new EducationWelcomeImage();
         _loc1_.y = 5;
         _loc1_.imageShaman.imageHandFinish.visible = false;
         addChild(_loc1_);
         addChild(new §_-i5§(gls("Привет! Я - беличий шаман.\nСейчас вместе отправимся в увлекательное\nпутешествие по миру Трагедии Белок!\n\nТебя ждут интересные и захватывающие\nприключения вместе с другими белочками!"),300,19,§_-W2P§));
         addChild(new §_-i5§(gls("Также, чтобы ты быстрее освоился\nв этом мире, я подготовил для тебя\nнемного простых заданий.\n\nВыполни их и ты легко освоишься.\nУдачи тебе, мой друг!"),300,163,§_-W2P§));
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Продолжить"));
         _loc2_.x = 415;
         _loc2_.y = 325;
         _loc2_.addEventListener(MouseEvent.CLICK,this.hide);
         addChild(_loc2_);
         place();
         this.height = 505;
         this.redrawModalBackdrop();
      }
   }
}

