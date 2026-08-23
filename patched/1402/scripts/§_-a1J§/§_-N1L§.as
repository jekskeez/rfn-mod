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
   import utils.StringUtil;
   import utils.§_-B1d§;
   import utils.§_-k12§;
   import utils.§_-p1r§;
   import views.§_-D14§;
   
   public class §_-N1L§ extends §_-M2N§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-i5§.§_-p1s§,90,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-QZ§:§_-i5§ = null;
      
      private var §_-rM§:§_-i5§ = null;
      
      protected var §_-W2d§:§_-i5§ = null;
      
      protected var §_-Mt§:§_-i5§ = null;
      
      protected var §_-y1R§:Sprite = null;
      
      private var §_-Q2B§:DisplayObject = null;
      
      private var §_-T9§:int = -1;
      
      private var §_-l2o§:Boolean = false;
      
      public function §_-N1L§()
      {
         super(MovieEndRoundDeath);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-n2M§();
         §_-k12§.§_-b2P§(this.animation);
         if(this.§_-l2o§)
         {
            GameSounds.play("dialog_place");
         }
         else
         {
            GameSounds.play("dialog_win");
         }
         if(§_-F1Z§.§_-O1u§)
         {
            addChild(new §_-D14§(globalToLocal(new Point(16,65)),new Point(this.§_-rM§.x + 23,this.§_-rM§.y + 32),false));
         }
      }
      
      override protected function init(param1:Class) : void
      {
         super.init(param1);
         var _loc2_:TextFormat = new TextFormat(null,14,8877877,true,null,null,null,null,TextFormatAlign.CENTER);
         this.§_-y1R§ = new Sprite();
         this.§_-y1R§.x = 39;
         this.§_-y1R§.y = 23;
         addChild(this.§_-y1R§);
         var _loc3_:DisplayObject = new ImageBgNutsEndRound();
         new §_-kr§(_loc3_,gls("Орехи"));
         _loc3_.x = 226;
         _loc3_.y = 39;
         this.§_-y1R§.addChild(_loc3_);
         _loc3_ = new ImageBgTimeEndRound();
         _loc3_.x = 32;
         _loc3_.y = 58;
         new §_-kr§(_loc3_,gls("Время прохождения"));
         this.§_-y1R§.addChild(_loc3_);
         this.§_-Q2B§ = new ImageBgStarEndRound();
         this.§_-Q2B§.x = 115;
         this.§_-Q2B§.y = 39;
         new §_-kr§(this.§_-Q2B§,gls("Опыт"));
         this.§_-y1R§.addChild(this.§_-Q2B§);
         this.§_-QZ§ = this.§_-y1R§.addChild(new §_-i5§("",249,48,_loc2_,45)) as §_-i5§;
         this.§_-rM§ = this.§_-y1R§.addChild(new §_-i5§("",142,48,_loc2_,45)) as §_-i5§;
         this.§_-W2d§ = this.§_-y1R§.addChild(new §_-i5§("-:--",13,48,_loc2_,60)) as §_-i5§;
         this.§_-Mt§ = new §_-i5§("",105,-145,TEXT_FORMAT,145);
         this.§_-Mt§.filters = [new DropShadowFilter(0,0,7147036,1,3,3,2)];
         this.§_-Q2F§.addChild(this.§_-Mt§);
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
         if(_loc2_.number != this.§_-T9§)
         {
            this.§_-C33§(_loc2_.number);
         }
         this.§_-W2d§.text = _loc2_.isDead || !_loc2_.§_-A2M§ ? "-:--" : §_-B1d§.§_-z2d§(_loc2_.time);
         this.§_-n2M§();
      }
      
      public function §_-C33§(param1:int) : void
      {
         this.§_-T9§ = param1;
         this.§_-Mt§.text = String(param1 + 1);
         if(param1 < 3)
         {
            this.§_-M1p§.text = gls("Ты пришел") + " " + StringUtil.§_-R5§(this.§_-T9§ + 1);
         }
         else
         {
            this.§_-M1p§.text = gls("Поздравляем!");
         }
         if(this.animation != null && this.§_-Q2F§.contains(this.animation))
         {
            this.§_-Q2F§.removeChild(this.animation);
         }
         var _loc2_:TextFormat = this.§_-Mt§.getTextFormat(0);
         var _loc3_:§_-p1r§ = new §_-p1r§();
         this.§_-l2o§ = false;
         switch(param1)
         {
            case 0:
               _loc2_.color = 16449495;
               _loc3_.§_-xC§(0,0,0,0);
               this.animation = new MovieEndRound1();
               break;
            case 1:
               _loc2_.color = 14277081;
               _loc3_.§_-xC§(0,0,0,0);
               this.animation = new MovieEndRound2();
               break;
            case 2:
               _loc2_.color = 16763569;
               _loc3_.§_-xC§(0,0,0,0);
               this.animation = new MovieEndRound3();
               break;
            default:
               _loc2_.color = 16777215;
               _loc3_.§_-xC§(0,0,0,-152);
               this.animation = new MovieEndRoundOther();
               this.§_-l2o§ = true;
         }
         this.animation.x = 175;
         this.animation.y = 63;
         §_-k12§.§_-b2P§(this.animation);
         this.§_-s2§.filters = [new ColorMatrixFilter(_loc3_)];
         this.§_-Mt§.setTextFormat(_loc2_,0);
         this.§_-Q2F§.addChildAt(this.animation,0);
      }
      
      public function §_-n2M§() : void
      {
         this.§_-QZ§.text = §_-N2w§.§_-T19§.toString();
         this.§_-rM§.text = §_-N2w§.§_-ZF§.toString();
      }
   }
}

