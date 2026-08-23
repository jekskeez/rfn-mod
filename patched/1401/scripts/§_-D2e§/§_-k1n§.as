package §_-D2e§
{
   import §_-68§.§_-EI§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-k1n§ extends Dialog
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,15,7625799,true);
      
      public function §_-k1n§()
      {
         super(gls("Добро пожаловать в трагедию белок!"),true,false,null,false);
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         §_-5K§.§_-2G§ = false;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         var e:MouseEvent = param1;
         super.hide();
         §_-5K§.§_-2G§ = true;
         §_-EI§.load(function():void
         {
            §_-71o§.show("Learning");
         },false,true);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,24,16763904,null,null,null,null,null,"center");
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
         addChild(new §_-22V§(gls("Привет! Я - беличий шаман.\nСейчас вместе отправимся в увлекательное\nпутешествие по миру Трагедии Белок!\n\nТебя ждут интересные и захватывающие\nприключения вместе с другими белочками!"),300,19,§_-i2c§));
         addChild(new §_-22V§(gls("Также, чтобы ты быстрее освоился\nв этом мире, я подготовил для тебя\nнемного простых заданий.\n\nВыполни их и ты легко освоишься.\nУдачи тебе, мой друг!"),300,163,§_-i2c§));
         var _loc2_:§_-j18§ = new §_-j18§(gls("Продолжить"));
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

