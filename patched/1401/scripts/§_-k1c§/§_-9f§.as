package §_-k1c§
{
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-W1e§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-t2V§;
   import §_-T2y§.Screen;
   import §_-T2y§.§_-5T§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-J29§;
   import §_-T2y§.§_-J2n§;
   import buttons.§_-T2z§;
   import buttons.§_-hH§;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import tape.§_-A3S§;
   import tape.§_-y1R§;
   import utils.§_-73l§;
   import utils.§_-x1Z§;
   import utils.§_-y2L§;
   
   public class §_-9f§ extends Dialog
   {
      
      private static const §_-e2Z§:int = 10;
      
      private static const §_-P10§:Matrix = new Matrix(1,0,0,1,15,7);
      
      private static const §_-13Y§:Matrix = new Matrix(1,0,0,1,2,2);
      
      private static const §_-q2U§:Matrix = new Matrix(0.5,0,0,0.5,30,400);
      
      private static const §_-u1a§:Rectangle = new Rectangle(0,0,720,470);
      
      private static const §_-dk§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,28,16776571);
      
      private static const §_-43T§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,28,16764465);
      
      private static const §_-k1j§:TextFormat = new TextFormat(null,18,16777215,true,null,null,null,null,"center");
      
      private static const §_-D10§:TextFormat = new TextFormat(null,18,3020044,true,null,null,null,null,"center");
      
      private static const §_-m2A§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private static const §_-82r§:Array = [new GlowFilter(2366553,0.9,10,10,3,2)];
      
      private static const §_-Bc§:Array = [new GlowFilter(16180707,1,7,7,3,2)];
      
      public static var §_-xf§:int = -1;
      
      public static var §_-72J§:Boolean = false;
      
      private static var §_-X1G§:DisplayObject = null;
      
      private static var FRAME:DisplayObject = null;
      
      private static var _instance:§_-9f§ = null;
      
      private static var §_-pj§:Object = {};
      
      private static var §_-SS§:Object = {};
      
      private static var §_-qQ§:Object = {};
      
      private static var §_-Y1R§:Object = {};
      
      private var §_-Qq§:int = -1;
      
      private var §_-BU§:int = -1;
      
      private var §_-E1t§:§_-A3S§ = null;
      
      private var §_-ah§:SimpleButton = null;
      
      private var §_-h2C§:MovieClip = null;
      
      private var §_-53C§:String;
      
      public function §_-9f§()
      {
         super(null,true,true,null,false);
         this.init();
      }
      
      public static function get instance() : §_-9f§
      {
         return _instance;
      }
      
      public static function show(param1:Boolean = false) : void
      {
         if(!_instance)
         {
            _instance = new §_-9f§();
         }
         if(!param1 && (§_-Q2v§.§_-U2K§ || !§_-72J§ && NotificationManager.instance.§_-S2r§ == §_-xf§))
         {
            §_-71o§.setStatus(§_-71o§.TV);
            return;
         }
         NotificationManager.instance.§_-42O§(§_-xf§);
         §_-W1e§.§_-q1R§(§_-W1e§.§_-K12§);
         _instance.show();
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-K12§);
      }
      
      public static function §_-a2O§(param1:int) : Class
      {
         var _loc2_:Object = §_-Ik§(param1);
         return _loc2_ ? getDefinitionByName(_loc2_.buttonClass) as Class : null;
      }
      
      public static function §_-X2y§(param1:int) : MovieClip
      {
         var PageClass:Class;
         var page:MovieClip;
         var captionFormat:TextFormat;
         var caption:§_-22V§;
         var news:Object = null;
         var range:Object = null;
         var id:int = param1;
         if(id in §_-pj§)
         {
            return §_-pj§[id];
         }
         news = §_-Ik§(id);
         if(!news)
         {
            return null;
         }
         PageClass = getDefinitionByName(news.imageClass) as Class;
         if(!PageClass)
         {
            return null;
         }
         page = new PageClass();
         §_-pj§[id] = page;
         captionFormat = news.captionVariant == "yellow" ? §_-dk§ : §_-43T§;
         caption = §_-h1l§(page,captionFormat,§_-m2A§,news.text);
         if(news.captionAccent)
         {
            range = news.captionAccent[§_-a9§.§_-sc§ ? "ru" : "en"];
            if(range.begin > range.end)
            {
               caption.setTextFormat(news.captionVariant == "yellow" ? §_-43T§ : §_-dk§,range.begin,range.end);
            }
         }
         if(news.bodyStyle == "brown_w")
         {
            §_-b17§(page,§_-D10§,§_-Bc§,news.subtext);
         }
         else
         {
            §_-b17§(page,§_-k1j§,§_-82r§,news.subtext);
         }
         if(news.button)
         {
            §_-qQ§[id] = addButton(page,news.button.text,function(param1:MouseEvent):void
            {
               runNewsAction(news);
               §_-W1e§.used(§_-W1e§.§_-K12§);
            });
         }
         §_-SS§[id] = news.shareText || news.text + " " + news.subtext;
         return page;
      }
      
      private static function §_-h1l§(param1:MovieClip, param2:TextFormat, param3:Array, param4:String) : §_-22V§
      {
         var _loc5_:§_-22V§ = new §_-22V§(param4,0,33,param2);
         _loc5_.x = 350 - int(_loc5_.textWidth * 0.5);
         _loc5_.filters = param3;
         param1.addChild(_loc5_);
         return _loc5_;
      }
      
      private static function §_-b17§(param1:MovieClip, param2:TextFormat, param3:Array, param4:String) : void
      {
         var _loc5_:§_-22V§ = new §_-22V§(param4,0,75,param2);
         _loc5_.x = 350 - int(_loc5_.textWidth * 0.5);
         _loc5_.filters = param3;
         param1.addChild(_loc5_);
      }
      
      private static function addButton(param1:MovieClip, param2:String, param3:Function) : §_-j18§
      {
         var _loc4_:§_-hH§ = new §_-hH§(param2,0,21,param3,1.5);
         _loc4_.x = 350 - int(_loc4_.width * 0.5);
         _loc4_.y = 400;
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      private static function §_-Ik§(param1:int) : Object
      {
         var _loc3_:Object = null;
         var _loc2_:Array = §_-t2V§.news;
         if(!_loc2_)
         {
            return null;
         }
         for each(_loc3_ in _loc2_)
         {
            if(Boolean(_loc3_) && _loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private static function §_-23i§(param1:String) : String
      {
         if(!param1)
         {
            return param1;
         }
         if(param1.indexOf("?lang=") >= 0 || param1.indexOf("&lang=") >= 0)
         {
            return param1;
         }
         var _loc2_:String = param1.indexOf("?") >= 0 ? "&" : "?";
         return param1 + _loc2_ + "lang=" + (§_-a9§.§_-sc§ ? "ru" : "en");
      }
      
      private static function runNewsAction(param1:Object) : void
      {
         var button:Object = null;
         var target:Screen = null;
         var url:String = null;
         var news:Object = param1;
         button = news.button;
         if(!button)
         {
            return;
         }
         switch(button.actionType)
         {
            case "shopPackages":
               _instance.hide();
               §_-EI§.load(function():void
               {
                  §_-m1L§.§_-Y1T§(§_-m1L§.§_-j2r§);
                  var _loc1_:int = int(button.outfit);
                  if(_loc1_)
                  {
                     §_-m1L§.§_-qc§(§_-g2W§.§_-X2e§(_loc1_),_loc1_);
                  }
               });
               break;
            case "shopAccessories":
               _instance.hide();
               §_-EI§.load(function():void
               {
                  §_-m1L§.§_-Y1T§(§_-m1L§.§_-Z2u§);
               });
               break;
            case "openScreen":
               _instance.hide();
               target = §_-71o§.§_-D1O§(button.screen);
               if(!target)
               {
                  break;
               }
               if(target is §_-J2n§ && "tab" in button)
               {
                  §_-J2n§.selected = int(button.tab);
               }
               if(target is §_-5T§ || target is §_-J29§)
               {
                  §_-EI§.load(function():void
                  {
                     §_-71o§.show(target);
                  });
               }
               else
               {
                  §_-71o§.show(target);
               }
               break;
            case "openUrl":
               url = button.url || "";
               if(url.length)
               {
                  _instance.hide();
                  navigateToURL(new URLRequest(§_-23i§(url)),"_blank");
               }
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-71o§.setStatus(§_-71o§.TV);
      }
      
      private function init() : void
      {
         if("useApiType" in §_-k2X§.§_-J2e§)
         {
            this.§_-53C§ = §_-k2X§.§_-J2e§["useApiType"];
         }
         else if("useapitype" in §_-k2X§.§_-J2e§)
         {
            this.§_-53C§ = §_-k2X§.§_-J2e§["useapitype"];
         }
         else
         {
            this.§_-53C§ = §_-a9§.§_-63Z§;
         }
         place();
         this.width = 857;
         this.height = 587;
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,28,16777215);
         this.§_-ah§ = new §_-T2z§(gls("Поделиться!"),[_loc1_,_loc1_,_loc1_],ButtonNewsRepost,13,-10,[new BevelFilter(1,300,16777215,1,4948022,1,1,1)]);
         this.§_-ah§.x = 335;
         this.§_-ah§.y = 480;
         this.§_-ah§.addEventListener(MouseEvent.CLICK,this.post);
         addChild(this.§_-ah§);
         this.§_-h2C§ = new ImageNewsAward();
         this.§_-h2C§.mouseEnabled = false;
         this.§_-h2C§.mouseChildren = false;
         this.§_-h2C§.x = this.§_-ah§.x + 370;
         this.§_-h2C§.y = this.§_-ah§.y + 7;
         addChild(this.§_-h2C§);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16777215);
         _loc2_.graphics.lineStyle(1,14733249);
         _loc2_.graphics.drawRoundRect(10,480,310,70,15,15);
         _loc2_.filters = [new DropShadowFilter(4,136,13086614,1,6,6,1,1,true)];
         addChild(_loc2_);
         var _loc3_:§_-y1R§ = new §_-y1R§();
         _loc3_.setData(this.§_-B34§);
         this.§_-E1t§ = new §_-A3S§(this.§_-Hp§);
         this.§_-E1t§.setData(_loc3_);
         addChild(this.§_-E1t§);
      }
      
      private function get §_-B34§() : Array
      {
         var _loc3_:Object = null;
         var _loc1_:Array = §_-t2V§.news;
         var _loc2_:Array = [];
         if(_loc1_)
         {
            for each(_loc3_ in _loc1_)
            {
               if(_loc3_)
               {
                  _loc2_.push(_loc3_.id);
               }
            }
         }
         if(!_loc2_.length)
         {
            return _loc2_;
         }
         _loc2_.sort(Array.NUMERIC);
         if(_loc2_.length > §_-e2Z§)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - §_-e2Z§,_loc2_.length);
         }
         §_-xf§ = _loc2_[_loc2_.length - 1];
         if(§_-xf§ == NotificationManager.instance.§_-S2r§)
         {
            §_-fO§.hide(NotificationManager.§_-K12§);
         }
         return _loc2_;
      }
      
      private function §_-Hp§(param1:int) : void
      {
         this.§_-h1j§ = param1;
      }
      
      private function get §_-h1j§() : int
      {
         return this.§_-BU§;
      }
      
      private function set §_-h1j§(param1:int) : void
      {
         this.§_-BU§ = param1;
         this.§_-ah§.filters = this.§_-01o§ ? [] : §_-x1Z§.§_-c2G§;
         this.§_-ah§.mouseEnabled = this.§_-01o§;
         this.§_-h2C§.visible = this.§_-01o§ && Game.§_-N2V§.indexOf(this.§_-BU§) == -1;
      }
      
      private function get §_-01o§() : Boolean
      {
         return this.§_-53C§ != "vk" && this.§_-53C§ != "sa";
      }
      
      private function post(param1:MouseEvent) : void
      {
         this.§_-Qq§ = this.§_-h1j§;
         var _loc2_:String = getQualifiedClassName(§_-pj§[this.§_-h1j§]);
         if(_loc2_.indexOf("::") != -1)
         {
            _loc2_ = _loc2_.split("::")[1];
         }
         §_-E1s§.save(this.§_-Gv§(),_loc2_);
         §_-73l§.place(Game.self,§_-73l§.WALL_NEWS,0,new Bitmap(this.§_-Gv§()),§_-SS§[this.§_-h1j§],§_-a9§.§_-t2x§ + "news/" + _loc2_ + ".jpg",true,this.§_-h2L§);
      }
      
      private function §_-h2L§(param1:Object) : void
      {
         if(param1 == null || this.§_-Qq§ == -1)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-5E§,0,this.§_-Qq§);
         Game.§_-N2V§.push(this.§_-Qq§);
         this.§_-Qq§ = -1;
      }
      
      private function §_-Gv§() : BitmapData
      {
         if(this.§_-h1j§ in §_-Y1R§)
         {
            return §_-Y1R§[this.§_-h1j§];
         }
         var _loc1_:String = Game.stage.quality;
         §_-y2L§.§_-af§(StageQuality.HIGH);
         if(FRAME == null)
         {
            FRAME = new ImageNewsFrame();
         }
         if(§_-X1G§ == null)
         {
            §_-X1G§ = §_-k2X§.§_-81z§();
         }
         var _loc2_:BitmapData = new BitmapData(FRAME.width + 3,FRAME.height + 3);
         var _loc3_:DisplayObject = §_-qQ§[this.§_-h1j§];
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
         _loc2_.draw(§_-pj§[this.§_-h1j§],§_-P10§,null,null,§_-u1a§);
         if(_loc3_)
         {
            _loc3_.visible = true;
         }
         _loc2_.draw(§_-X1G§,§_-q2U§);
         _loc2_.draw(FRAME,§_-13Y§);
         §_-Y1R§[this.§_-h1j§] = _loc2_;
         §_-y2L§.§_-af§(_loc1_);
         return §_-Y1R§[this.§_-h1j§];
      }
   }
}

