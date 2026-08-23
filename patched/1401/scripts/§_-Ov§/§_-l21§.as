package §_-Ov§
{
   import flash.display3D.Context3DBlendFactor;
   import flash.geom.Rectangle;
   import starling.filters.FragmentFilter;
   import starling.textures.*;
   
   public class §_-l21§
   {
      
      private var §_-Jl§:String = "";
      
      private var §_-LA§:String = "";
      
      public var §_-1c§:Number = 1;
      
      public var isAnimated:Boolean = false;
      
      public var firstFrame:uint = 0;
      
      public var lastFrame:int = -1;
      
      public var loops:uint = 1;
      
      public var randomStartFrames:Boolean = false;
      
      public var tinted:Boolean = true;
      
      public var premultipliedAlpha:Boolean = true;
      
      public var spawnTime:Number = 0;
      
      public var fadeInTime:Number = 0;
      
      public var fadeOutTime:Number = 0;
      
      public var emitterType:Number = 0;
      
      public var maxParticles:uint = 10;
      
      public var §_-l2e§:Number = 0;
      
      public var §_-716§:Number = 0;
      
      public var §_-Y2W§:Number = 0;
      
      public var §_-21s§:Number = 0;
      
      public var §_-lK§:Number = 1;
      
      public var §_-U2G§:Number = 0;
      
      public var angle:Number = 0;
      
      public var angleVariance:Number = 0;
      
      public var emitAngleAlignedRotation:Boolean = false;
      
      public var startParticleSize:Number = 20;
      
      public var startParticleSizeVariance:Number = 0;
      
      public var finishParticleSize:Number = 20;
      
      public var finishParticleSizeVariance:Number = 0;
      
      public var rotationStart:Number = 0;
      
      public var rotationStartVariance:Number = 0;
      
      public var rotationEnd:Number = 0;
      
      public var rotationEndVariance:Number = 0;
      
      public var duration:Number = 2;
      
      public var §_-232§:Number = 0;
      
      public var §_-r1M§:Number = 0;
      
      public var speed:Number = 50;
      
      public var speedVariance:Number = 0;
      
      public var radialAcceleration:Number = 0;
      
      public var §_-72O§:Number = 0;
      
      public var tangentialAcceleration:Number = 0;
      
      public var §_-Pg§:Number = 0;
      
      public var maxRadius:Number = 100;
      
      public var maxRadiusVariance:Number = 0;
      
      public var minRadius:Number = 0;
      
      public var minRadiusVariance:Number = 0;
      
      public var rotatePerSecond:Number = 0;
      
      public var rotatePerSecondVariance:Number = 0;
      
      public var startColor:§_-b1i§ = new §_-b1i§(1,1,1,1);
      
      public var startColorVariance:§_-b1i§ = new §_-b1i§(0,0,0,0);
      
      public var finishColor:§_-b1i§ = new §_-b1i§(1,1,1,1);
      
      public var finishColorVariance:§_-b1i§ = new §_-b1i§(0,0,0,0);
      
      public var filter:FragmentFilter;
      
      public var §_-q1F§:Function;
      
      public var sortFunction:Function;
      
      public var §_-t1H§:Boolean = false;
      
      public var blendFuncSource:String = "one";
      
      public var blendFuncDestination:String = "oneMinusSourceAlpha";
      
      public var excactBounds:Boolean = false;
      
      public var §_-9v§:Vector.<Frame>;
      
      public var texture:Texture;
      
      public var atlasXML:XML;
      
      public function §_-l21§(param1:Texture, param2:XML = null, param3:XML = null)
      {
         super();
         if(!param1)
         {
            throw new Error("texture must not be null");
         }
         this.texture = param1;
         this.atlasXML = param2;
         if(param3)
         {
            §_-l21§.§_-s1d§(param3,param1,param2,this);
         }
      }
      
      public static function §_-s1d§(param1:XML, param2:Texture, param3:XML = null, param4:§_-l21§ = null) : §_-l21§
      {
         var _loc5_:XMLList = null;
         if(!param4)
         {
            param4 = new §_-l21§(param2,param3);
         }
         param4.texture = param2;
         param4.atlasXML = param3;
         param4.§_-l2e§ = parseFloat(param1.sourcePosition.attribute("x"));
         param4.§_-716§ = parseFloat(param1.sourcePosition.attribute("y"));
         param4.§_-Y2W§ = parseFloat(param1.sourcePositionVariance.attribute("x"));
         param4.§_-21s§ = parseFloat(param1.sourcePositionVariance.attribute("y"));
         param4.§_-232§ = parseFloat(param1.gravity.attribute("x"));
         param4.§_-r1M§ = parseFloat(param1.gravity.attribute("y"));
         param4.emitterType = §_-83x§(param1.emitterType);
         param4.maxParticles = §_-83x§(param1.maxParticles);
         param4.§_-lK§ = Math.max(0.01,§_-T2C§(param1.particleLifeSpan));
         param4.§_-U2G§ = §_-T2C§(param1.particleLifespanVariance);
         param4.startParticleSize = §_-T2C§(param1.startParticleSize);
         param4.startParticleSizeVariance = §_-T2C§(param1.startParticleSizeVariance);
         param4.finishParticleSize = §_-T2C§(param1.finishParticleSize);
         param4.finishParticleSizeVariance = §_-T2C§(param1.finishParticleSizeVariance);
         param4.angle = §_-T2C§(param1.angle);
         param4.angleVariance = §_-T2C§(param1.angleVariance);
         param4.rotationStart = §_-T2C§(param1.rotationStart);
         param4.rotationStartVariance = §_-T2C§(param1.rotationStartVariance);
         param4.rotationEnd = §_-T2C§(param1.rotationEnd);
         param4.rotationEndVariance = §_-T2C§(param1.rotationEndVariance);
         param4.emitAngleAlignedRotation = §_-Q1S§(param1.emitAngleAlignedRotation);
         param4.speed = §_-T2C§(param1.speed);
         param4.speedVariance = §_-T2C§(param1.speedVariance);
         param4.radialAcceleration = §_-T2C§(param1.radialAcceleration);
         param4.§_-72O§ = §_-T2C§(param1.radialAccelVariance);
         param4.tangentialAcceleration = §_-T2C§(param1.tangentialAcceleration);
         param4.§_-Pg§ = §_-T2C§(param1.tangentialAccelVariance);
         param4.maxRadius = §_-T2C§(param1.maxRadius);
         param4.maxRadiusVariance = §_-T2C§(param1.maxRadiusVariance);
         param4.minRadius = §_-T2C§(param1.minRadius);
         param4.minRadiusVariance = §_-T2C§(param1.minRadiusVariance);
         param4.rotatePerSecond = §_-T2C§(param1.rotatePerSecond);
         param4.rotatePerSecondVariance = §_-T2C§(param1.rotatePerSecondVariance);
         §_-f1b§(param1.startColor,param4.startColor);
         §_-f1b§(param1.startColorVariance,param4.startColorVariance);
         §_-f1b§(param1.finishColor,param4.finishColor);
         §_-f1b§(param1.finishColorVariance,param4.finishColorVariance);
         param4.blendFuncSource = §_-22t§(param1.blendFuncSource);
         param4.blendFuncDestination = §_-22t§(param1.blendFuncDestination);
         param4.duration = §_-T2C§(param1.duration);
         if(isNaN(param4.finishParticleSizeVariance))
         {
            param4.finishParticleSizeVariance = §_-T2C§(param1.FinishParticleSizeVariance);
         }
         if(isNaN(param4.§_-lK§))
         {
            param4.§_-lK§ = Math.max(0.01,§_-T2C§(param1.particleLifespan));
         }
         if(isNaN(param4.§_-U2G§))
         {
            param4.§_-U2G§ = §_-T2C§(param1.particleLifeSpanVariance);
         }
         if(param1.animation.length())
         {
            _loc5_ = param1.animation.isAnimated;
            if(_loc5_.length())
            {
               param4.isAnimated = §_-Q1S§(_loc5_) && Boolean(param3);
            }
            _loc5_ = param1.animation.firstFrame;
            if(_loc5_.length())
            {
               param4.§_-M2Z§ = _loc5_.attribute("value");
               if(param4.§_-M2Z§ == "")
               {
                  param4.firstFrame = §_-83x§(_loc5_);
               }
            }
            _loc5_ = param1.animation.lastFrame;
            if(_loc5_.length())
            {
               param4.§_-B6§ = _loc5_.attribute("value");
               if(param4.§_-B6§ == "")
               {
                  param4.lastFrame = §_-83x§(_loc5_);
               }
            }
            _loc5_ = param1.animation.numberOfAnimatedFrames;
            if(_loc5_.length())
            {
               param4.lastFrame = _loc5_.length() ? int(int(param4.firstFrame) + (param4.§_-1c§ = §_-83x§(_loc5_))) : param4.lastFrame;
            }
            _loc5_ = param1.animation.loops;
            if(_loc5_.length())
            {
               param4.loops = §_-T2C§(_loc5_);
            }
            _loc5_ = param1.animation.randomStartFrames;
            if(_loc5_.length())
            {
               param4.randomStartFrames = §_-Q1S§(_loc5_);
            }
         }
         _loc5_ = param1.tinted;
         if(_loc5_.length())
         {
            param4.tinted = §_-Q1S§(_loc5_);
         }
         _loc5_ = param1.premultipliedAlpha;
         if(_loc5_.length())
         {
            param4.premultipliedAlpha = §_-Q1S§(_loc5_);
         }
         _loc5_ = param1.spawnTime;
         if(_loc5_.length())
         {
            param4.spawnTime = §_-T2C§(_loc5_);
         }
         _loc5_ = param1.fadeInTime;
         if(_loc5_.length())
         {
            param4.fadeInTime = §_-T2C§(_loc5_);
         }
         _loc5_ = param1.fadeOutTime;
         if(_loc5_.length())
         {
            param4.fadeOutTime = §_-T2C§(_loc5_);
         }
         _loc5_ = param1.excactBounds;
         if(_loc5_.length())
         {
            param4.excactBounds = §_-Q1S§(_loc5_);
         }
         param4.§_-y2m§();
         return param4;
      }
      
      private static function §_-BK§(param1:String, param2:XML) : int
      {
         var idx:int = 0;
         var value:String = param1;
         var atlasXML:XML = param2;
         if(Boolean(atlasXML) && isNaN(Number(value)))
         {
            idx = int(atlasXML.SubTexture.(@name == value).childIndex());
            if(idx == -1)
            {
            }
            return idx;
         }
         return int(value);
      }
      
      private static function §_-Q1S§(param1:XMLList) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         if(param1[0])
         {
            _loc2_ = param1.attribute("value").toLowerCase();
            _loc3_ = parseInt(param1.attribute("value"));
            return _loc2_ == "true" || _loc3_ > 0;
         }
         return false;
      }
      
      private static function §_-83x§(param1:XMLList) : int
      {
         var _loc2_:int = parseInt(param1.attribute("value"));
         return isNaN(_loc2_) ? 0 : _loc2_;
      }
      
      private static function §_-T2C§(param1:XMLList) : Number
      {
         var _loc2_:Number = parseFloat(param1.attribute("value"));
         return isNaN(_loc2_) ? 0 : _loc2_;
      }
      
      private static function §_-f1b§(param1:XMLList, param2:§_-b1i§) : §_-b1i§
      {
         var _loc3_:Number = NaN;
         if(!param2)
         {
            param2 = new §_-b1i§();
         }
         _loc3_ = parseFloat(param1.attribute("red"));
         if(!isNaN(_loc3_))
         {
            param2.red = _loc3_;
         }
         _loc3_ = parseFloat(param1.attribute("green"));
         if(!isNaN(_loc3_))
         {
            param2.green = _loc3_;
         }
         _loc3_ = parseFloat(param1.attribute("blue"));
         if(!isNaN(_loc3_))
         {
            param2.blue = _loc3_;
         }
         _loc3_ = parseFloat(param1.attribute("alpha"));
         if(!isNaN(_loc3_))
         {
            param2.alpha = _loc3_;
         }
         return param2;
      }
      
      private static function §_-22t§(param1:XMLList) : String
      {
         var _loc2_:String = param1.attribute("value");
         if(isNaN(Number(_loc2_)) && Context3DBlendFactor[_loc2_] !== undefined)
         {
            return Context3DBlendFactor[_loc2_];
         }
         var _loc3_:int = §_-83x§(param1);
         switch(_loc3_)
         {
            case 0:
               return Context3DBlendFactor.ZERO;
            case 1:
               return Context3DBlendFactor.ONE;
            case 768:
               return Context3DBlendFactor.SOURCE_COLOR;
            case 769:
               return Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR;
            case 770:
               return Context3DBlendFactor.SOURCE_ALPHA;
            case 771:
               return Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA;
            case 772:
               return Context3DBlendFactor.DESTINATION_ALPHA;
            case 773:
               return Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA;
            case 774:
               return Context3DBlendFactor.DESTINATION_COLOR;
            case 775:
               return Context3DBlendFactor.ONE_MINUS_DESTINATION_COLOR;
            default:
               throw new ArgumentError("unsupported blending function: " + _loc3_);
         }
      }
      
      public function get §_-S28§() : Vector.<Frame>
      {
         if(!this.§_-9v§)
         {
            this.§_-y2m§();
         }
         return this.§_-9v§;
      }
      
      public function §_-ZQ§(param1:Object) : §_-l21§
      {
         var p:String = null;
         var object:Object = param1;
         for(p in object)
         {
            try
            {
               this[p] = object[p];
            }
            catch(err:*)
            {
            }
         }
         this.§_-y2m§();
         return this;
      }
      
      public function clone(param1:§_-l21§ = null) : §_-l21§
      {
         if(!param1)
         {
            param1 = new §_-l21§(this.texture,this.atlasXML);
         }
         param1.texture = this.texture;
         param1.atlasXML = this.atlasXML;
         param1.§_-l2e§ = this.§_-l2e§;
         param1.§_-716§ = this.§_-716§;
         param1.§_-Y2W§ = this.§_-Y2W§;
         param1.§_-21s§ = this.§_-21s§;
         param1.§_-232§ = this.§_-232§;
         param1.§_-r1M§ = this.§_-r1M§;
         param1.emitterType = this.emitterType;
         param1.maxParticles = this.maxParticles;
         param1.§_-lK§ = this.§_-lK§;
         param1.§_-U2G§ = this.§_-U2G§;
         param1.startParticleSize = this.startParticleSize;
         param1.startParticleSizeVariance = this.startParticleSizeVariance;
         param1.finishParticleSize = this.finishParticleSize;
         param1.finishParticleSizeVariance = this.finishParticleSizeVariance;
         param1.angle = this.angle;
         param1.angleVariance = this.angleVariance;
         param1.rotationStart = this.rotationStart;
         param1.rotationStartVariance = this.rotationStartVariance;
         param1.rotationEnd = this.rotationEnd;
         param1.rotationEndVariance = this.rotationEndVariance;
         param1.emitAngleAlignedRotation = this.emitAngleAlignedRotation;
         param1.speed = this.speed;
         param1.speedVariance = this.speedVariance;
         param1.radialAcceleration = this.radialAcceleration;
         param1.§_-72O§ = this.§_-72O§;
         param1.tangentialAcceleration = this.tangentialAcceleration;
         param1.§_-Pg§ = this.§_-Pg§;
         param1.maxRadius = this.maxRadius;
         param1.maxRadiusVariance = this.maxRadiusVariance;
         param1.minRadius = this.minRadius;
         param1.minRadiusVariance = this.minRadiusVariance;
         param1.rotatePerSecond = this.rotatePerSecond;
         param1.rotatePerSecondVariance = this.rotatePerSecondVariance;
         param1.startColor = this.startColor;
         param1.startColorVariance = this.startColorVariance;
         param1.finishColor = this.finishColor;
         param1.finishColorVariance = this.finishColorVariance;
         param1.blendFuncSource = this.blendFuncSource;
         param1.blendFuncDestination = this.blendFuncDestination;
         param1.duration = this.duration;
         param1.isAnimated = this.isAnimated;
         param1.§_-M2Z§ = this.§_-M2Z§;
         param1.firstFrame = this.firstFrame;
         param1.§_-B6§ = this.§_-B6§;
         param1.lastFrame = this.lastFrame;
         param1.lastFrame = this.lastFrame;
         param1.loops = this.loops;
         param1.randomStartFrames = this.randomStartFrames;
         param1.tinted = this.tinted;
         param1.spawnTime = this.spawnTime;
         param1.fadeInTime = this.fadeInTime;
         param1.fadeOutTime = this.fadeOutTime;
         param1.excactBounds = this.excactBounds;
         param1.filter = this.filter;
         param1.§_-q1F§ = this.§_-q1F§;
         param1.sortFunction = this.sortFunction;
         param1.§_-t1H§ = this.§_-t1H§;
         param1.§_-9v§ = this.§_-9v§;
         return param1;
      }
      
      public function §_-P1W§(param1:XML = null) : XML
      {
         var _loc2_:XML = param1 ? param1 : this.atlasXML;
         var _loc3_:XML = XML("<particleEmitterConfig/>");
         _loc3_.angle.@value = isNaN(this.angle) ? 0 : this.angle.toFixed(2);
         _loc3_.angleVariance.@value = isNaN(this.angleVariance) ? 0 : this.angleVariance.toFixed(2);
         _loc3_.duration.@value = isNaN(this.duration) ? 0 : this.duration.toFixed(2);
         _loc3_.emitterType.@value = isNaN(this.emitterType) ? 0 : this.emitterType.toFixed(2);
         _loc3_.emitAngleAlignedRotation.@value = int(this.emitAngleAlignedRotation);
         _loc3_.excactBounds.@value = int(this.excactBounds);
         _loc3_.finishParticleSize.@value = isNaN(this.finishParticleSize) ? 10 : this.finishParticleSize.toFixed(2);
         _loc3_.finishParticleSizeVariance.@value = isNaN(this.finishParticleSizeVariance) ? 0 : this.finishParticleSizeVariance.toFixed(2);
         _loc3_.gravity.@x = isNaN(this.§_-232§) ? 0 : this.§_-232§.toFixed(2);
         _loc3_.gravity.@y = isNaN(this.§_-r1M§) ? 0 : this.§_-r1M§.toFixed(2);
         if(this.isAnimated || this.randomStartFrames || this.firstFrame != 0)
         {
            if(_loc2_)
            {
            }
            _loc3_.animation.isAnimated.@value = int(this.isAnimated);
            _loc3_.animation.firstFrame.@value = this.§_-7L§(this.firstFrame,_loc2_);
            _loc3_.animation.lastFrame.@value = this.§_-7L§(this.lastFrame,_loc2_);
            _loc3_.animation.loops.@value = this.loops;
            _loc3_.animation.randomStartFrames.@value = int(this.randomStartFrames);
         }
         _loc3_.maxParticles.@value = isNaN(this.maxParticles) ? 0 : this.maxParticles.toFixed(2);
         _loc3_.maxRadius.@value = isNaN(this.maxRadius) ? 0 : this.maxRadius.toFixed(2);
         _loc3_.maxRadiusVariance.@value = isNaN(this.maxRadiusVariance) ? 0 : this.maxRadiusVariance.toFixed(2);
         _loc3_.minRadius.@value = isNaN(this.minRadius) ? 0 : this.minRadius.toFixed(2);
         _loc3_.minRadiusVariance.@value = isNaN(this.minRadiusVariance) ? 0 : this.minRadiusVariance.toFixed(2);
         _loc3_.particleLifeSpan.@value = isNaN(this.§_-lK§) ? 0 : this.§_-lK§.toFixed(2);
         _loc3_.particleLifespanVariance.@value = isNaN(this.§_-U2G§) ? 0 : this.§_-U2G§.toFixed(2);
         _loc3_.radialAcceleration.@value = isNaN(this.radialAcceleration) ? 0 : this.radialAcceleration.toFixed(2);
         _loc3_.radialAccelVariance.@value = isNaN(this.§_-72O§) ? 0 : this.§_-72O§.toFixed(2);
         _loc3_.rotatePerSecond.@value = isNaN(this.rotatePerSecond) ? 0 : this.rotatePerSecond.toFixed(2);
         _loc3_.rotatePerSecondVariance.@value = isNaN(this.rotatePerSecondVariance) ? 0 : this.rotatePerSecondVariance.toFixed(2);
         _loc3_.rotationEnd.@value = isNaN(this.rotationEnd) ? 0 : this.rotationEnd.toFixed(2);
         _loc3_.rotationEndVariance.@value = isNaN(this.rotationEndVariance) ? 0 : this.rotationEndVariance.toFixed(2);
         _loc3_.rotationStart.@value = isNaN(this.rotationStart) ? 0 : this.rotationStart.toFixed(2);
         _loc3_.rotationStartVariance.@value = isNaN(this.rotationStartVariance) ? 0 : this.rotationStartVariance.toFixed(2);
         _loc3_.sourcePosition.@x = isNaN(this.§_-l2e§) ? 0 : this.§_-l2e§.toFixed(2);
         _loc3_.sourcePosition.@y = isNaN(this.§_-716§) ? 0 : this.§_-716§.toFixed(2);
         _loc3_.sourcePositionVariance.@x = isNaN(this.§_-Y2W§) ? 0 : this.§_-Y2W§.toFixed(2);
         _loc3_.sourcePositionVariance.@y = isNaN(this.§_-21s§) ? 0 : this.§_-21s§.toFixed(2);
         _loc3_.speed.@value = isNaN(this.speed) ? 0 : this.speed.toFixed(2);
         _loc3_.speedVariance.@value = isNaN(this.speedVariance) ? 0 : this.speedVariance.toFixed(2);
         _loc3_.startParticleSize.@value = isNaN(this.startParticleSize) ? 10 : this.startParticleSize.toFixed(2);
         _loc3_.startParticleSizeVariance.@value = isNaN(this.startParticleSizeVariance) ? 0 : this.startParticleSizeVariance.toFixed(2);
         _loc3_.tangentialAcceleration.@value = isNaN(this.tangentialAcceleration) ? 0 : this.tangentialAcceleration.toFixed(2);
         _loc3_.tangentialAccelVariance.@value = isNaN(this.§_-Pg§) ? 0 : this.§_-Pg§.toFixed(2);
         _loc3_.tinted.@value = int(this.tinted);
         _loc3_.premultipliedAlpha.@value = Boolean(this.premultipliedAlpha);
         _loc3_.startColor.@red = isNaN(this.startColor.red) ? 1 : this.startColor.red;
         _loc3_.startColor.@green = isNaN(this.startColor.green) ? 1 : this.startColor.green;
         _loc3_.startColor.@blue = isNaN(this.startColor.blue) ? 1 : this.startColor.blue;
         _loc3_.startColor.@alpha = isNaN(this.startColor.alpha) ? 1 : this.startColor.alpha;
         _loc3_.startColorVariance.@red = isNaN(this.startColorVariance.red) ? 0 : this.startColorVariance.red;
         _loc3_.startColorVariance.@green = isNaN(this.startColorVariance.green) ? 0 : this.startColorVariance.green;
         _loc3_.startColorVariance.@blue = isNaN(this.startColorVariance.blue) ? 0 : this.startColorVariance.blue;
         _loc3_.startColorVariance.@alpha = isNaN(this.startColorVariance.alpha) ? 0 : this.startColorVariance.alpha;
         _loc3_.finishColor.@red = isNaN(this.finishColor.red) ? 1 : this.finishColor.red;
         _loc3_.finishColor.@green = isNaN(this.finishColor.green) ? 1 : this.finishColor.green;
         _loc3_.finishColor.@blue = isNaN(this.finishColor.blue) ? 1 : this.finishColor.blue;
         _loc3_.finishColor.@alpha = isNaN(this.finishColor.alpha) ? 1 : this.finishColor.alpha;
         _loc3_.finishColorVariance.@red = isNaN(this.finishColorVariance.red) ? 0 : this.finishColorVariance.red;
         _loc3_.finishColorVariance.@green = isNaN(this.finishColorVariance.green) ? 0 : this.finishColorVariance.green;
         _loc3_.finishColorVariance.@blue = isNaN(this.finishColorVariance.blue) ? 0 : this.finishColorVariance.blue;
         _loc3_.finishColorVariance.@alpha = isNaN(this.finishColorVariance.alpha) ? 0 : this.finishColorVariance.alpha;
         _loc3_.blendFuncSource.@value = this.blendFuncSource.replace(/([A-Z])/g,"_$1").toUpperCase();
         _loc3_.blendFuncDestination.@value = this.blendFuncDestination.replace(/([A-Z])/g,"_$1").toUpperCase();
         return _loc3_;
      }
      
      private function §_-7L§(param1:int, param2:XML = null) : String
      {
         var name:String;
         var idx:int = param1;
         var atlasXML:XML = param2;
         if(atlasXML == null)
         {
            return idx.toString();
         }
         name = atlasXML.SubTexture[idx].@name;
         if(atlasXML.SubTexture.(@name == name).length() == 1)
         {
            return name;
         }
         return idx.toString();
      }
      
      public function §_-y2m§() : void
      {
         var w:int = 0;
         var h:int = 0;
         var animationLoopLength:int = 0;
         var l:int = 0;
         var mNumberOfFrames:int = 0;
         var mFrameLUTLength:int = 0;
         var st:SubTexture = null;
         var rect:Rectangle = null;
         var matches:XMLList = null;
         var idx:int = 0;
         var i:int = 0;
         var subTexture:XML = null;
         var x:Number = NaN;
         var y:Number = NaN;
         var width:Number = NaN;
         var height:Number = NaN;
         var wf:Number = NaN;
         var hf:Number = NaN;
         this.§_-9v§ = new Vector.<Frame>(0);
         if(this.atlasXML)
         {
            w = this.texture.root.nativeWidth;
            h = this.texture.root.nativeHeight;
            this.firstFrame = Math.min(this.firstFrame,this.atlasXML.SubTexture.length() - 1);
            this.lastFrame = this.lastFrame == -1 ? this.atlasXML.SubTexture.length() : this.lastFrame;
            if(Boolean(this.texture) && this.texture is SubTexture)
            {
               st = SubTexture(this.texture);
               rect = st.§_-X11§;
               rect.x *= st.root.nativeWidth;
               rect.y *= st.root.nativeHeight;
               rect.width *= st.root.nativeWidth;
               rect.height *= st.root.nativeHeight;
               matches = this.atlasXML.SubTexture.(@x == rect.x).(@y == rect.y).(@width == rect.width).(@height == rect.height);
               if(matches.length() >= 1 && this.firstFrame == 0)
               {
                  idx = matches[0].childIndex();
                  if(idx >= 0)
                  {
                     this.firstFrame = idx;
                  }
               }
            }
            this.lastFrame = Math.max(this.firstFrame,Math.min(this.lastFrame,this.atlasXML.SubTexture.length() - 1));
            animationLoopLength = this.lastFrame - this.firstFrame + 1;
            this.isAnimated = this.isAnimated && animationLoopLength > 1;
            this.loops = this.isAnimated ? uint(this.loops + (this.randomStartFrames ? 1 : 0)) : 1;
            animationLoopLength = this.isAnimated || this.randomStartFrames ? animationLoopLength : 1;
            l = 0;
            while(l < this.loops)
            {
               i = 0;
               while(i < animationLoopLength)
               {
                  subTexture = this.atlasXML.SubTexture[i + this.firstFrame];
                  x = parseFloat(subTexture.attribute("x"));
                  y = parseFloat(subTexture.attribute("y"));
                  width = parseFloat(subTexture.attribute("width"));
                  height = parseFloat(subTexture.attribute("height"));
                  this.§_-9v§[i + l * animationLoopLength] = new Frame(w,h,x,y,width,height);
                  i++;
               }
               l++;
            }
            mNumberOfFrames = this.§_-9v§.length - 1 - (this.randomStartFrames && this.isAnimated ? animationLoopLength : 0);
            mFrameLUTLength = this.§_-9v§.length - 1;
            this.isAnimated = this.isAnimated && this.§_-9v§.length > 1;
            this.randomStartFrames = this.randomStartFrames && this.§_-9v§.length > 1;
         }
         else if(this.texture is SubTexture)
         {
            st = SubTexture(this.texture);
            wf = st.parent.width * st.scale;
            hf = st.parent.height * st.scale;
            this.§_-9v§[0] = new Frame(st.root.nativeWidth,st.root.nativeHeight,st.§_-X11§.x * wf,st.§_-X11§.y * hf,st.§_-X11§.width * wf,st.§_-X11§.height * hf);
         }
         else
         {
            this.§_-9v§[0] = new Frame(this.texture.width,this.texture.height,0,0,this.texture.width,this.texture.height);
         }
         this.§_-9v§.fixed = true;
      }
      
      public function get §_-M2Z§() : String
      {
         return this.§_-Jl§;
      }
      
      public function set §_-M2Z§(param1:String) : void
      {
         var _loc2_:int = §_-BK§(param1,this.atlasXML);
         if(_loc2_ != -1)
         {
            this.firstFrame = _loc2_;
            this.§_-Jl§ = param1;
         }
         else
         {
            this.§_-Jl§ = "";
         }
      }
      
      public function get §_-B6§() : String
      {
         return this.§_-LA§;
      }
      
      public function set §_-B6§(param1:String) : void
      {
         var _loc2_:int = §_-BK§(param1,this.atlasXML);
         if(_loc2_ != -1)
         {
            this.lastFrame = §_-BK§(param1,this.atlasXML);
            this.§_-LA§ = param1;
         }
         else
         {
            this.§_-LA§ = "";
         }
      }
   }
}

