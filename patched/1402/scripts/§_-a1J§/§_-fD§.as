package §_-a1J§
{
   import §_-48§.ListDataEvent;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-F1Z§;
   import §_-cA§.§_-tP§;
   import §_-td§.§_-N2w§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import sounds.GameSounds;
   import utils.§_-B1d§;
   import utils.§_-k12§;
   import utils.§_-p1r§;
   import views.§_-D14§;
   
   public class §_-fD§ extends §_-M2N§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-i5§.§_-p1s§,90,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-4O§:TextFormat = new TextFormat(null,14,8877877,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-QZ§:§_-i5§ = null;
      
      private var §_-e2b§:§_-i5§ = null;
      
      private var §_-rM§:§_-i5§ = null;
      
      protected var §_-W2d§:§_-i5§ = null;
      
      protected var §_-Mt§:§_-i5§ = null;
      
      protected var §_-y1R§:Sprite = null;
      
      private var §_-r2v§:DisplayObject = null;
      
      private var §_-Q2B§:DisplayObject = null;
      
      public function §_-fD§()
      {
         super(MovieEndRoundShaman);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-n2M§();
         §_-k12§.§_-b2P§(this.animation);
         GameSounds.play("dialog_shaman");
         if(§_-F1Z§.§_-O1u§)
         {
            addChild(new §_-D14§(globalToLocal(new Point(10,65)),new Point(this.§_-rM§.x + 23,this.§_-rM§.y + 32),false));
            addChild(new §_-D14§(globalToLocal(new Point(20,65)),new Point(this.§_-e2b§.x + 23,this.§_-e2b§.y + 32),true));
         }
      }
      
      override protected function init(param1:Class) : void
      {
         super.init(param1);
         this.§_-y1R§ = new Sprite();
         this.§_-y1R§.x = 39;
         this.§_-y1R§.y = 23;
         addChild(this.§_-y1R§);
         var _loc2_:DisplayObject = new ImageBgNutsEndRound();
         new §_-kr§(_loc2_,gls("Орехи"));
         _loc2_.x = 241;
         _loc2_.y = 39;
         this.§_-y1R§.addChild(_loc2_);
         _loc2_ = new ImageBgTimeEndRound();
         _loc2_.x = 19;
         _loc2_.y = 58;
         new §_-kr§(_loc2_,gls("Время прохождения"));
         this.§_-y1R§.addChild(_loc2_);
         this.§_-r2v§ = new ImageBgManaEndRound();
         this.§_-r2v§.x = 80;
         this.§_-r2v§.y = 44;
         new §_-kr§(this.§_-r2v§,gls("Шаманский опыт"));
         this.§_-y1R§.addChild(this.§_-r2v§);
         this.§_-Q2B§ = new ImageBgStarEndRound();
         this.§_-Q2B§.x = 158;
         this.§_-Q2B§.y = 39;
         new §_-kr§(this.§_-Q2B§,gls("Опыт"));
         this.§_-y1R§.addChild(this.§_-Q2B§);
         this.§_-M1p§.text = gls("Поздравляем!");
         this.§_-QZ§ = this.§_-y1R§.addChild(new §_-i5§("",262,48,§_-4O§,45)) as §_-i5§;
         this.§_-W2d§ = this.§_-y1R§.addChild(new §_-i5§("-:--",3,48,§_-4O§,60)) as §_-i5§;
         this.§_-e2b§ = this.§_-y1R§.addChild(new §_-i5§("",103,48,§_-4O§,45)) as §_-i5§;
         this.§_-rM§ = this.§_-y1R§.addChild(new §_-i5§("",186,48,§_-4O§,45)) as §_-i5§;
         this.§_-Mt§ = new §_-i5§("",106,-138,TEXT_FORMAT,145);
         this.§_-Mt§.filters = [new DropShadowFilter(0,0,7147036,1,3,3,2)];
         this.§_-Q2F§.addChild(this.§_-Mt§);
         var _loc3_:§_-p1r§ = new §_-p1r§();
         _loc3_.§_-xC§(0,0,0,-87);
         §_-k12§.§_-b2P§(this.animation);
         this.§_-s2§.filters = [new ColorMatrixFilter(_loc3_)];
         this.§_-n2M§();
         setBgHeight = 220;
      }
      
      override protected function §_-O2K§(param1:ListDataEvent) : void
      {
         super.§_-O2K§(param1);
         this.§_-n2M§();
      }
      
      override protected function §_-ZV§(param1:ListDataEvent) : void
      {
         super.§_-ZV§(param1);
         var _loc2_:§_-tP§ = this.§_-G19§.self;
         if(!_loc2_)
         {
            return;
         }
         this.§_-W2d§.text = _loc2_.isDead || !_loc2_.§_-A2M§ ? "-:--" : §_-B1d§.§_-z2d§(_loc2_.time);
         this.§_-n2M§();
      }
      
      public function §_-n2M§() : void
      {
         this.§_-QZ§.text = §_-N2w§.§_-T19§.toString();
         this.§_-e2b§.text = §_-N2w§.§_-M1P§.toString();
         this.§_-rM§.text = §_-N2w§.§_-ZF§.toString();
      }
   }
}

